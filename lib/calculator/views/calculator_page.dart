import 'package:flutter/material.dart';
import 'package:flutter_practice/calculator/logic/operation.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late final TextEditingController firstOperandController;
  late final TextEditingController secondOperandController;
  final operation = Operation();
  double? result;

  @override
  void initState() {
    firstOperandController = TextEditingController();
    secondOperandController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstOperandController.dispose();
    secondOperandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                key: const ValueKey('result'),
                result?.toString() ?? 'Result',
                style: Theme.of(context).textTheme.headline3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      key: const ValueKey('firstOperand'),
                      controller: firstOperandController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      key: const ValueKey('secondOperand'),
                      controller: secondOperandController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      setState(() {
                        result = operation
                            .sum(
                                operand1:
                                    int.parse(firstOperandController.text),
                                operand2:
                                    int.parse(secondOperandController.text))
                            .toDouble();
                      });
                    },
                    child: const Text('+'),
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      setState(() {
                        result = operation
                            .difference(
                                operand1:
                                    int.parse(firstOperandController.text),
                                operand2:
                                    int.parse(secondOperandController.text))
                            .toDouble();
                      });
                    },
                    child: const Text('-'),
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      setState(() {
                        result = operation
                            .product(
                                operand1:
                                    int.parse(firstOperandController.text),
                                operand2:
                                    int.parse(secondOperandController.text))
                            .toDouble();
                      });
                    },
                    child: const Text('*'),
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      setState(() {
                        result = operation.division(
                            operand1: int.parse(firstOperandController.text),
                            operand2: int.parse(secondOperandController.text));
                      });
                    },
                    child: const Text('/'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
