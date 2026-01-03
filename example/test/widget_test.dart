import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('App builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const GarmischShowcaseApp());
    expect(find.text('Garmisch'), findsOneWidget);
    expect(find.text('Design System'), findsOneWidget);
  });
}

