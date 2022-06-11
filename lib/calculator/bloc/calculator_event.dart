part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class AddButtonTapped extends CalculatorEvent {
  final int firstOperand;
  final int secondOperand;

  const AddButtonTapped(this.firstOperand, this.secondOperand);
}

class SubtractButtonTapped extends CalculatorEvent {
  final int firstOperand;
  final int secondOperand;

  const SubtractButtonTapped(this.firstOperand, this.secondOperand);
}

class MultiplyButtonTapped extends CalculatorEvent {
  final int firstOperand;
  final int secondOperand;

  const MultiplyButtonTapped(this.firstOperand, this.secondOperand);
}

class DivideButtonTapped extends CalculatorEvent {
  final int firstOperand;
  final int secondOperand;

  const DivideButtonTapped(this.firstOperand, this.secondOperand);
}
