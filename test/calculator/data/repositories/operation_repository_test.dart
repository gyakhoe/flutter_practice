import 'package:flutter_practice/calculator/data/repositories/operation_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator Operations test -', () {
    final operation = OperationRepository();
    test('Testing SUM', () {
      final sum = operation.sum(operand1: 1, operand2: 1);
      expect(sum, 2);
    });

    test('Testing Difference 1-1', () {
      final diff = operation.difference(operand1: 1, operand2: 1);
      expect(diff, 0);
    });

    test('Testing product 1*1', () {
      final product = operation.product(operand1: 1, operand2: 1);
      expect(product, 1);
    });

    test('Testing division 1/1 ', () {
      final division = operation.division(operand1: 1, operand2: 1);
      expect(division, 1);
    });
  });
}
