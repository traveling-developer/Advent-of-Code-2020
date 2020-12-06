import 'dart:math';

import 'package:adventofcode2020/advent_of_code_api.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(5);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  int puzzleSolution = convertedPuzzleInput.map((e) => e.seatId).reduce(max);

  print(puzzleSolution);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(5);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var seatIds = convertedPuzzleInput.map((e) => e.seatId);

  var seatIdBefore = seatIds
      .firstWhere((element) => seatIds.contains(element + 2) && !seatIds.contains(element + 1));

  print(seatIdBefore + 1);
}

List<BoardingPass> convertPuzzleInput(String puzzleInput) {
  var boardingPasses =
      puzzleInput.split('\n').where((element) => element.isNotEmpty).map((element) {
    var rowDefinition = element.substring(0, 7);
    var columnDefinition = element.substring(7, element.length);

    return BoardingPass(rowDefinition, columnDefinition);
  });

  return boardingPasses.toList();
}

class BoardingPass {
  String rowDefinition;
  String columnDefinition;

  BoardingPass(this.rowDefinition, this.columnDefinition);

  int get seatId {
    return row * 8 + column;
  }

  int get row {
    return calculateNumber(rowDefinition, Iterable<int>.generate(128).toList(), 'F');
  }

  int get column {
    return calculateNumber(columnDefinition, Iterable<int>.generate(8).toList(), 'L');
  }

  int calculateNumber(String definition, List<int> numbers, String lowerDefinition) {
    if (definition.length == 1) {
      if (definition == lowerDefinition) {
        return numbers.first;
      } else {
        return numbers[1];
      }
    }

    var newRangeLimit = (numbers.length / 2).abs().toInt();
    var newDefinition = definition.substring(1, definition.length);

    if (definition[0] == lowerDefinition) {
      var numbersSublist = numbers.sublist(0, newRangeLimit);
      return calculateNumber(newDefinition, numbersSublist, lowerDefinition);
    } else {
      var numbersSublist = numbers.sublist(newRangeLimit, numbers.length);
      return calculateNumber(newDefinition, numbersSublist, lowerDefinition);
    }
  }
}
