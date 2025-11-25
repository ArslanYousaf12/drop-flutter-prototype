// Basic widget tests for Drop Prototype app
// Full test suite will be added in Phase 4

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:drop_prototype/main.dart';

void main() {
  testWidgets('App should launch and show product feed', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const ProviderScope(child: DropApp()));

    // Verify that the app bar title is visible
    expect(find.text('Products'), findsOneWidget);
  });
}
