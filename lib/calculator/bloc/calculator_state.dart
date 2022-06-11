part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {
  final String result;

  const CalculatorInitial(this.result);

  @override
  List<Object> get props => [result];
}

class CalculatorResultSuccessful extends CalculatorState {
  final double result;

  const CalculatorResultSuccessful(this.result);

  @override
  List<Object> get props => [result];
}

class ClaculatorResultFailure extends CalculatorState {
  final String message;

  const ClaculatorResultFailure(this.message);

  @override
  List<Object> get props => [message];
}
