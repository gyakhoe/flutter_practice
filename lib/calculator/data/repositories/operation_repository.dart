class OperationRepository {
  int sum({required int operand1, required int operand2}) {
    return operand1 + operand2;
  }

  int difference({required int operand1, required int operand2}) {
    return operand1 - operand2;
  }

  int product({required int operand1, required int operand2}) {
    return operand1 * operand2;
  }

  double division({required int operand1, required int operand2}) {
    return operand1 / operand2;
  }
}
