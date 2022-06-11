import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practice/calculator/data/repositories/operation_repository.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc({
    required OperationRepository operationRepository,
  })  : _operationRepository = operationRepository,
        super(const CalculatorInitial('Result')) {
    on<AddButtonTapped>(_addButtonPressedToState);
    on<SubtractButtonTapped>(_subtractButtonPressedToState);
    on<MultiplyButtonTapped>(_multiplyButtonTappedToState);
    on<DivideButtonTapped>(_divideButtonTappedToState);
  }

  final OperationRepository _operationRepository;

  FutureOr<void> _addButtonPressedToState(
    AddButtonTapped event,
    Emitter<CalculatorState> emit,
  ) {
    final sum = _operationRepository.sum(
        operand1: event.firstOperand, operand2: event.secondOperand);
    emit(CalculatorResultSuccessful(sum.toDouble()));
  }

  FutureOr<void> _subtractButtonPressedToState(
      SubtractButtonTapped event, Emitter<CalculatorState> emit) {
    final difference = _operationRepository.difference(
        operand1: event.firstOperand, operand2: event.secondOperand);
    emit(CalculatorResultSuccessful(difference.toDouble()));
  }

  FutureOr<void> _multiplyButtonTappedToState(
      MultiplyButtonTapped event, Emitter<CalculatorState> emit) {
    final product = _operationRepository.product(
        operand1: event.firstOperand, operand2: event.secondOperand);
    emit(CalculatorResultSuccessful(product.toDouble()));
  }

  FutureOr<void> _divideButtonTappedToState(
      DivideButtonTapped event, Emitter<CalculatorState> emit) {
    final division = _operationRepository.division(
        operand1: event.firstOperand, operand2: event.secondOperand);
    emit(CalculatorResultSuccessful(division));
  }
}
