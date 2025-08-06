// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_task_rescheduler/main.dart';

void main() {
  testWidgets('App should start with login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the login screen is displayed
    expect(find.text('Smart Task Rescheduler'), findsOneWidget);
    expect(find.text('Sign in to manage your tasks'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });

  testWidgets('Login form validation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Try to login without entering credentials
    await tester.tap(find.text('Sign In'));
    await tester.pump();

    // Should show validation errors
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Login with valid credentials', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Enter valid credentials
    await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'password123');

    // Tap login button
    await tester.tap(find.text('Sign In'));
    await tester.pump();

    // Should not show validation errors
    expect(find.text('Please enter your email'), findsNothing);
    expect(find.text('Please enter your password'), findsNothing);

    // Wait for the async operation to complete
    await tester.pumpAndSettle();
  });
}
