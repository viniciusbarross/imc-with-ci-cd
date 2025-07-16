import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/bmi_controller.dart';
import 'package:myapp/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Test initial validation of insert data page',
      (WidgetTester tester) async {
    print('Starting test: Test initial validation of insert data page');
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BMIController(),
        child: const MyApp(),
      ),
    );
    print('Widget pumped');

    expect(find.text("Please, enter the weight!"), findsNothing);
    expect(find.text("Please, enter the height!"), findsNothing);
    print('Initial validation checks passed');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    print('Button tapped and pumped');

    expect(find.text("Please, enter the weight!"), findsOneWidget);
    expect(find.text("Please, enter the height!"), findsOneWidget);
    print('Validation messages appeared as expected');

    print('Test completed successfully');
  });
}
