import 'package:adventofcode2020/day1.dart';
import 'package:test/test.dart';

void main() {
  group('day 1', () {
    test('calculateSolution examples for first puzzle', () {
      List<int> input = [1721, 979, 366, 299, 675, 1456];

      var solution = calculateSolution(input, 2);

      expect(solution, equals(514579));
    });

    test('calculateSolution examples for second puzzle', () {
      List<int> input = [1721, 979, 366, 299, 675, 1456];

      var solution = calculateSolution(input, 3);

      expect(solution, equals(241861950));
    });
  });
}
