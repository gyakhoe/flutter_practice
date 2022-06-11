import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/calculator/bloc/calculator_bloc.dart';
import 'package:flutter_practice/calculator/data/repositories/operation_repository.dart';
import 'package:flutter_practice/calculator/views/calculator_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Calculator page smoke test', (WidgetTester tester) async {
    // Build widget to test for
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) =>
            CalculatorBloc(operationRepository: OperationRepository()),
        child: CalculatorPage(),
      ),
    ));

    // Test the widget built
    expect(find.text('Result'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('*'), findsOneWidget);
    expect(find.text('/'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));

    // testing when buttons are pressed
    // entering values to text filed.

    await tester.enterText(find.byKey(const ValueKey('firstOperand')), '10');

    await tester.enterText(find.byKey(const ValueKey('secondOperand')), '10');

    await tester.tap(find.text('+'));
    await tester.pump();
    expect(find.text('20.0'), findsOneWidget);

    await tester.tap(find.text('-'));
    await tester.pump();
    expect(find.text('0.0'), findsOneWidget);
  });
}
