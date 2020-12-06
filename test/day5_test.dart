import 'package:adventofcode2020/day5.dart';
import 'package:test/test.dart';

void main() {
  group('day 5', () {
    var exampleInput = '''BFFFBBFRRR
FFFBBBFRRR
BBFFBBFRLL
''';

    var firstBoardingPass = BoardingPass('FBFBBFF', 'RLR');
    var secondBoardingPass = BoardingPass('BBFFBBF', 'LLR');

    test('convertPuzzleInput example input returns boarding passes', () {
      var result = convertPuzzleInput(exampleInput);

      expect(result.length, equals(3));
    });

    test('convertPuzzleInput boarding pass contains row and column definition', () {
      var input = '''BFFFBBFRRR''';

      var result = convertPuzzleInput(input);

      var boardingPass = result.first;
      expect(boardingPass.rowDefinition, equals('BFFFBBF'));
      expect(boardingPass.columnDefinition, equals('RRR'));
    });

    test('getRow first example input returns valid row number', () {
      var result = firstBoardingPass.row;

      expect(result, equals(44));
    });

    test('getColumn first example input returns valid column number', () {
      var result = firstBoardingPass.column;

      expect(result, equals(5));
    });

    test('getRow second example input returns valid row number', () {
      var result = secondBoardingPass.row;

      expect(result, equals(102));
    });

    test('getColumn second example input returns valid column number', () {
      var result = secondBoardingPass.column;

      expect(result, equals(1));
    });

    test('getSeatId first example returns seat ID ', () {
      var result = firstBoardingPass.seatId;

      expect(result, equals(357));
    });

    test('getSeatId second example returns seat ID ', () {
      var result = secondBoardingPass.seatId;

      expect(result, equals(817));
    });
  });
}
