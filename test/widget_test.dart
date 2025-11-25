// Basic widget tests for Drop Prototype app
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:drop_prototype/main.dart';

void main() {
  testWidgets('App should launch and show product feed', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const ProviderScope(child: DropApp()));

    // Wait for async data to load (shimmer appears first)
    await tester.pump();

    // Verify that the app bar title is visible
    expect(find.text('Products'), findsOneWidget);

    // Wait for the mock data to load (500ms delay)
    await tester.pump(const Duration(milliseconds: 600));

    // After loading, we should see product cards
    expect(find.byType(Card), findsWidgets);
  });
}
