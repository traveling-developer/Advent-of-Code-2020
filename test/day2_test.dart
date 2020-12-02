import 'package:adventofcode2020/day2.dart';
import 'package:test/test.dart';

void main() {
  group('day 2', () {
    test('convert puzzle input', () {
      String input = '10-13 a: abcde';

      var solution = convertPuzzleInput(input);

      expect(solution.first.toNumber, equals(13));
      expect(solution.first.fromNumber, equals(10));
      expect(solution.first.policyChar, equals('a'));
      expect(solution.first.password, equals('abcde'));
    });

    test('isValidForFirstPuzzle providing an valid password returns true', () {
      var passwordWithPolicy = PasswordWithPolicy('abcde', 1, 3, 'a');

      var solution = passwordWithPolicy.isValidForFirstPuzzle();

      expect(solution, isTrue);
    });

    test('isValidForFirstPuzzle providing an invalid password returns false', () {
      var passwordWithPolicy = PasswordWithPolicy('cdefg', 1, 3, 'b');

      var solution = passwordWithPolicy.isValidForFirstPuzzle();

      expect(solution, isFalse);
    });

    test('solving first puzzle', () {
      List<PasswordWithPolicy> input = [
        PasswordWithPolicy('abcde', 1, 3, 'a'),
        PasswordWithPolicy('cdefg', 1, 3, 'b'),
        PasswordWithPolicy('ccccccccc', 2, 9, 'c'),
      ];

      var solution = calculateSolution(input, (element) => element.isValidForFirstPuzzle());

      expect(solution, equals(2));
    });

    test('isValidForSecondPuzzle providing an valid password returns true', () {
      var passwordWithPolicy = PasswordWithPolicy('abcde', 1, 3, 'a');

      var solution = passwordWithPolicy.isValidForSecondPuzzle();

      expect(solution, isTrue);
    });

    test('isValidForSecondPuzzle providing an invalid password returns false', () {
      var passwordWithPolicy = PasswordWithPolicy('ccccccccc', 2, 9, 'c');

      var solution = passwordWithPolicy.isValidForSecondPuzzle();

      expect(solution, isFalse);
    });

    test('solving first puzzle', () {
      List<PasswordWithPolicy> input = [
        PasswordWithPolicy('abcde', 1, 3, 'a'),
        PasswordWithPolicy('cdefg', 1, 3, 'b'),
        PasswordWithPolicy('ccccccccc', 2, 9, 'c'),
      ];

      var solution = calculateSolution(input, (element) => element.isValidForSecondPuzzle());

      expect(solution, equals(1));
    });
  });
}
