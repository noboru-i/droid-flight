import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:droid_flight/pages/home/home_notifier.dart';
import 'package:droid_flight/pages/home/home_state.dart';
import 'package:droid_flight/pages/detail/detail_notifier.dart';

void main() {
  group('HomeNotifier', () {
    testWidgets('should initialize with empty state', (WidgetTester tester) async {
      final notifier = HomeNotifier();
      
      expect(notifier.value.betaApps.isEmpty, true);
      expect(notifier.value.selectedFilter, 'All');
      
      notifier.dispose();
    });

    testWidgets('should add beta app correctly', (WidgetTester tester) async {
      final notifier = HomeNotifier();
      
      final app = BetaAppData(
        applicationId: 'test.app.id',
        image: 'test_image.png',
        name: 'Test App',
        tags: ['test', 'beta'],
        section: 'Testing',
      );
      
      await notifier.addBetaApp(app);
      
      expect(notifier.value.betaApps.containsKey('Testing'), true);
      expect(notifier.value.betaApps['Testing']!.length, 1);
      expect(notifier.value.betaApps['Testing']!.first.name, 'Test App');
      
      notifier.dispose();
    });

    testWidgets('should update filter correctly', (WidgetTester tester) async {
      final notifier = HomeNotifier();
      
      notifier.updateFilter('Productivity');
      
      expect(notifier.value.selectedFilter, 'Productivity');
      
      notifier.dispose();
    });
  });

  group('DetailNotifier', () {
    testWidgets('should initialize with loading state', (WidgetTester tester) async {
      final notifier = DetailNotifier(applicationId: 'test.app.id');
      
      expect(notifier.value.isLoading, true);
      expect(notifier.value.app, null);
      expect(notifier.value.error, null);
      
      // Wait for async initialization to complete
      await tester.pumpAndSettle();
      
      notifier.dispose();
    });
  });
}
