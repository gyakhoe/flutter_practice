import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/calculator/bloc/calculator_bloc.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({Key? key}) : super(key: key);

  final TextEditingController firstOperandController = TextEditingController();
  final TextEditingController secondOperandController = TextEditingController();

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
              BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
                  if (state is ClaculatorResultFailure) {
                    return resultText(state.message, context);
                  } else if (state is CalculatorResultSuccessful) {
                    return resultText(state.result.toString(), context);
                  }

                  return resultText('Result', context);
                },
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
                      BlocProvider.of<CalculatorBloc>(context).add(
                        AddButtonTapped(
                          int.parse(firstOperandController.text),
                          int.parse(secondOperandController.text),
                        ),
                      );
                    },
                    child: const Text('+'),
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      BlocProvider.of<CalculatorBloc>(context).add(
                          SubtractButtonTapped(
                              int.parse(firstOperandController.text),
                              int.parse(secondOperandController.text)));
                    },
                    child: const Text('-'),
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      BlocProvider.of<CalculatorBloc>(context).add(
                          MultiplyButtonTapped(
                              int.parse(firstOperandController.text),
                              int.parse(secondOperandController.text)));
                    },
                    child: const Text('*'),
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      BlocProvider.of<CalculatorBloc>(context).add(
                          DivideButtonTapped(
                              int.parse(firstOperandController.text),
                              int.parse(secondOperandController.text)));
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

  Text resultText(String result, BuildContext context) {
    return Text(
      result,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
