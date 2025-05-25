import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'home_state.dart';

class HomeNotifier extends ValueNotifier<HomeState> {
  HomeNotifier() : super(const HomeState()) {
    loadFromPrefs();
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('betaApps');
    if (jsonString == null) {
      return; // No data to load
    }
    final decoded = json.decode(jsonString) as Map<String, dynamic>;
    final Map<String, List<BetaAppData>> loaded = {};
    decoded.forEach((key, value) {
      loaded[key] = (value as List)
          .map((e) => BetaAppData(
                applicationId: e['applicationId'],
                image: e['image'],
                name: e['name'],
                tags: List<String>.from(e['tags']),
                section: e['section'],
              ))
          .toList();
    });
    value = value.copyWith(betaApps: loaded);
  }

  void updateFilter(String filter) {
    value = value.copyWith(selectedFilter: filter);
  }

  Future<void> addBetaApp(BetaAppData app) async {
    final newBetaApps = Map<String, List<BetaAppData>>.from(value.betaApps);
    final section = app.section ?? 'Other';
    if (newBetaApps.containsKey(section)) {
      newBetaApps[section] = [...newBetaApps[section]!, app];
    } else {
      newBetaApps[section] = [app];
    }
    value = value.copyWith(betaApps: newBetaApps);
    await _saveToPrefs(newBetaApps);
  }

  Future<void> _saveToPrefs(Map<String, List<BetaAppData>> betaApps) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> jsonMap = {};
    betaApps.forEach((key, list) {
      jsonMap[key] = list
          .map((e) => {
                'applicationId': e.applicationId,
                'image': e.image,
                'name': e.name,
                'tags': e.tags,
                'section': e.section,
              })
          .toList();
    });
    await prefs.setString('betaApps', json.encode(jsonMap));
  }
}
