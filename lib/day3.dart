import 'package:adventofcode2020/advent_of_code_api.dart';
import 'package:tuple/tuple.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(3);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var slope = const Tuple2(3, 1);

  var puzzleSolution = calculateSolution(convertedPuzzleInput, slope);

  print(puzzleSolution);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(3);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var slopes = [
    const Tuple2(1, 1),
    const Tuple2(3, 1),
    const Tuple2(5, 1),
    const Tuple2(7, 1),
    const Tuple2(1, 2)
  ];

  var puzzleSolution = slopes
      .map((e) => calculateSolution(convertedPuzzleInput, e))
      .reduce((value, element) => value * element);

  print(puzzleSolution);
}

int calculateSolution(List<String> convertedPuzzleInput, Tuple2<int, int> slope) {
  int numberOfTrees = 0;
  var x = 0;
  var y = 0;

  while (y < convertedPuzzleInput.length - 1) {
    y += slope.item2;
    x = (x + slope.item1) % convertedPuzzleInput[0].length;

    var value = convertedPuzzleInput[y][x];

    if (value == '#') {
      numberOfTrees++;
    }
  }

  return numberOfTrees;
}

List<String> convertPuzzleInput(String puzzleInput) {
  var result = puzzleInput.split('\n').where((element) => element.isNotEmpty).toList();

  return result;
}
