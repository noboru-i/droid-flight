import 'package:flutter/foundation.dart';

import 'home_state.dart';

class HomeNotifier extends ValueNotifier<HomeState> {
  HomeNotifier() : super(_initState());

  static HomeState _initState() {
    const Map<String, List<BetaAppData>> initialBetaApps = {
      'Your beta programs': [
        BetaAppData(
          image:
              'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/taskmaster.png',
          name: 'TaskMaster',
          section: 'Your beta programs',
        ),
      ],
      'Communication': [
        BetaAppData(
          image:
              'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/chatterbox.png',
          name: 'ChatterBox',
          section: 'Communication',
        ),
        BetaAppData(
          image:
              'https://raw.githubusercontent.com/noboru-i/droid-flight/main/assets/connectnow.png',
          name: 'ConnectNow',
          section: 'Communication',
        ),
      ],
    };

    return const HomeState(betaApps: initialBetaApps);
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
