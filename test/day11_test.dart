import 'package:adventofcode2020/day11.dart';
import 'package:test/test.dart';

void main() {
  group('day 11', () {
    var exampleInput = '''L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL''';

    test('convertPuzzleInput example input returns waiting area with seats', () {
      var result = convertPuzzleInput(exampleInput);

      expect(result.length, equals(10));
      expect(result.width, equals(10));
    });

    test('convertPuzzleInput one input returns seat', () {
      var input = 'L.LL.LL.L.';
      var waitingArea = convertPuzzleInput(input);

      var seat = waitingArea.seats.first.first;

      expect(seat.isEmpty, isTrue);
      expect(seat.isFloor, isFalse);
      expect(seat.needsToBeChange, isFalse);
    });

    test('convertPuzzleInput one input returns seat', () {
      var input = 'L.LL.LL.L.';
      var waitingArea = convertPuzzleInput(input);

      var seat = waitingArea.seats.first.last;

      expect(seat.isEmpty, isFalse);
      expect(seat.isFloor, isTrue);
      expect(seat.needsToBeChange, isFalse);
    });

    test('calculateFirstSolution example input returns 37', () {
      var waitingArea = convertPuzzleInput(exampleInput);

      var result = waitingArea.calculateFirstSolution();

      expect(result, equals(37));
    });

    test('calculateSecondSolution example input returns 26', () {
      var waitingArea = convertPuzzleInput(exampleInput);

      var result = waitingArea.calculateSecondSolution();

      expect(result, equals(26));
    });
  });
}
