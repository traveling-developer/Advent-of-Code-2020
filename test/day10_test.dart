import 'package:adventofcode2020/day10.dart';
import 'package:test/test.dart';

void main() {
  group('day 10', () {
    var exampleInput = '''16
10
15
5
1
11
7
19
6
12
4''';

    var secondExampleInput = '''28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
''';

    test('convertPuzzleInput example input returns ints', () {
      var result = convertPuzzleInput(exampleInput);

      expect(result.length, equals(11));
    });

    test('calculateFirstSolution example input returns 35', () {
      var input = convertPuzzleInput(exampleInput);

      var result = calculateFirstSolution(input);

      expect(result, equals(35));
    });

    test('calculateFirstSolution second example input returns 220', () {
      var input = convertPuzzleInput(secondExampleInput);

      var result = calculateFirstSolution(input);

      expect(result, equals(220));
    });

    test('calculateSecondSolution example input returns 8', () {
      var input = convertPuzzleInput(exampleInput);

      var result = calculateSecondSolution(input);

      expect(result, equals(8));
    });

    test('calculateSecondSolution second example input returns 19208', () {
      var input = convertPuzzleInput(secondExampleInput);

      var result = calculateSecondSolution(input);

      expect(result, equals(19208));
    });
  });
}
