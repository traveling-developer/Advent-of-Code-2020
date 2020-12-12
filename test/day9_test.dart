import 'package:adventofcode2020/day9.dart';
import 'package:test/test.dart';

void main() {
  group('day 9', () {
    var exampleInput = '''35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
''';

    test('convertPuzzleInput example input returns ints', () {
      var result = convertPuzzleInput(exampleInput);

      expect(result.length, equals(20));
    });

    test('calculateFirstSolution example input returns 127', () {
      var input = convertPuzzleInput(exampleInput);

      var result = calculateFirstSolution(input, 5, 5);

      expect(result, equals(127));
    });

    test('calculateSecondSolution example input returns 62', () {
      var input = convertPuzzleInput(exampleInput);

      var result = calculateSecondSolution(input, 127);

      expect(result, equals(62));
    });
  });
}
