import 'package:adventofcode2020/day3.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

void main() {
  List<String> input = [
    '..##.......',
    '#...#...#..',
    '.#....#..#.',
    '..#.#...#.#',
    '.#...##..#.',
    '..#.##.....',
    '.#.#.#....#',
    '.#........#',
    '#.##...#...',
    '#...##....#',
    '.#..#...#.#'
  ];

  group('day 3', () {
    test('slope (3,1) returns 7', () {
      var solution = calculateSolution(input, const Tuple2(3, 1));

      expect(solution, equals(7));
    });

    test('slope (1,1) returns 2', () {
      var solution = calculateSolution(input, const Tuple2(1, 1));

      expect(solution, equals(2));
    });

    test('slope (5,1) returns 3', () {
      var solution = calculateSolution(input, const Tuple2(5, 1));

      expect(solution, equals(3));
    });

    test('slope (7,1) returns 4', () {
      var solution = calculateSolution(input, const Tuple2(7, 1));

      expect(solution, equals(4));
    });

    test('slope (1,2) returns 2', () {
      var solution = calculateSolution(input, const Tuple2(1, 2));

      expect(solution, equals(2));
    });
  });
}
