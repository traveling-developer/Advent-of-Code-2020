import 'package:adventofcode2020/day8.dart';
import 'package:test/test.dart';

void main() {
  group('day 8', () {
    var exampleInput = '''nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
''';

    test('convertPuzzleInput example input returns instructions', () {
      var result = convertPuzzleInput(exampleInput);

      expect(result.length, equals(9));
    });

    test('convertPuzzleInput example input returns instructions', () {
      var input = 'jmp -3';

      var result = convertPuzzleInput(input).first;

      expect(result.operation, equals('jmp'));
      expect(result.argument, equals(-3));
      expect(result.wasExecuted, isFalse);
    });

    test('from copies instruction', () {
      var input = Instruction('acc', 12);
      input.wasExecuted = true;

      var result = Instruction.from(input);

      expect(result.operation, equals(input.operation));
      expect(result.argument, equals(input.argument));
      expect(result.wasExecuted, equals(input.wasExecuted));
    });

    test('calculateFirstSolution example input returns 5', () {
      var input = convertPuzzleInput(exampleInput);

      var result = calculateFirstSolution(input);

      expect(result.item1, equals(5));
    });

    test('swapOperation operation is jmp sets it to nop', () {
      var input = Instruction('jmp', 12);
      input.wasExecuted = true;

      swapOperation(input);

      expect(input.operation, equals('nop'));
      expect(input.argument, equals(input.argument));
      expect(input.wasExecuted, equals(input.wasExecuted));
    });

    test('swapOperation operation is nop sets it to jmp', () {
      var input = Instruction('nop', 12);
      input.wasExecuted = true;

      swapOperation(input);

      expect(input.operation, equals('jmp'));
      expect(input.argument, equals(input.argument));
      expect(input.wasExecuted, equals(input.wasExecuted));
    });

    test('swapOperation operation is acc nothing is changed', () {
      var input = Instruction('acc', 12);
      input.wasExecuted = true;

      swapOperation(input);

      expect(input.operation, equals(input.operation));
      expect(input.argument, equals(input.argument));
      expect(input.wasExecuted, equals(input.wasExecuted));
    });

    test('calculateSecondSolution example input returns 8', () {
      var input = convertPuzzleInput(exampleInput);

      var result = calculateSecondSolution(input);

      expect(result, equals(8));
    });
  });
}
