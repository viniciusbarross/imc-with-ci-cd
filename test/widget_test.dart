import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/bmi_controller.dart';
import 'package:myapp/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Test initial validation of insert data page',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BMIController(),
        child: const MyApp(),
      ),
    );

    expect(find.text("Please, enter the weight!"), findsNothing);
    expect(find.text("Please, enter the height!"), findsNothing);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text("Please, enter the weight!"), findsOneWidget);
    expect(find.text("Please, enter the height!"), findsOneWidget);
  });
}
