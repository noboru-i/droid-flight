import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'detail_state.dart';
import 'package:droid_flight/pages/home/home_state.dart';

class DetailNotifier extends ValueNotifier<DetailState> {
  final String applicationId;
  
  DetailNotifier({required this.applicationId}) : super(const DetailState()) {
    loadAppData();
  }

  Future<void> loadAppData() async {
    value = value.copyWith(isLoading: true, error: null);
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString('betaApps');
      
      if (jsonString == null) {
        value = value.copyWith(
          isLoading: false, 
          error: 'No app data found'
        );
        return;
      }
      
      final decoded = json.decode(jsonString) as Map<String, dynamic>;
      BetaAppData? foundApp;
      
      // Search for the app across all categories
      for (final categoryData in decoded.values) {
        final apps = (categoryData as List).map((e) => BetaAppData(
          applicationId: e['applicationId'],
          image: e['image'],
          name: e['name'],
          tags: List<String>.from(e['tags']),
          section: e['section'],
        )).toList();
        
        foundApp = apps.firstWhere(
          (app) => app.applicationId == applicationId,
          orElse: () => apps.isEmpty ? null : apps.first,
        );
        
        if (foundApp != null && foundApp.applicationId == applicationId) {
          break;
        } else {
          foundApp = null;
        }
      }
      
      if (foundApp != null) {
        value = value.copyWith(
          app: foundApp,
          isLoading: false,
        );
      } else {
        value = value.copyWith(
          isLoading: false,
          error: 'App not found',
        );
      }
    } catch (e) {
      value = value.copyWith(
        isLoading: false,
        error: 'Failed to load app data: $e',
      );
    }
  }
}