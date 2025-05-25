import 'package:flutter/foundation.dart';

import 'home_state.dart';

class HomeNotifier extends ValueNotifier<HomeState> {
  HomeNotifier() : super(_initState());

  static HomeState _initState() {
    final Map<String, List<BetaAppData>> initialBetaApps = {
      'Your beta programs': [
        const BetaAppData(
          applicationId: 'com.example.taskmaster',
          image:
              'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/taskmaster.png',
          name: 'TaskMaster',
          section: 'Your beta programs',
          tags: ['productivity'],
        ),
      ],
      'Communication': [
        const BetaAppData(
          applicationId: 'com.example.chatterbox',
          image:
              'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/chatterbox.png',
          name: 'ChatterBox',
          section: 'Communication',
          tags: ['social', 'messaging'],
        ),
        const BetaAppData(
          applicationId: 'com.example.connectnow',
          image:
              'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/connectnow.png',
          name: 'ConnectNow',
          section: 'Communication',
          tags: ['social', 'video'],
        ),
      ],
    };

    return HomeState(betaApps: initialBetaApps);
  }

  void updateFilter(String filter) {
    value = value.copyWith(selectedFilter: filter);
  }

  void addBetaApp(BetaAppData app) {
    final newBetaApps = Map<String, List<BetaAppData>>.from(value.betaApps);

    final section = app.section ?? 'Other';
    if (newBetaApps.containsKey(section)) {
      newBetaApps[section] = [...newBetaApps[section]!, app];
    } else {
      newBetaApps[section] = [app];
    }

    value = value.copyWith(betaApps: newBetaApps);
  }
}
