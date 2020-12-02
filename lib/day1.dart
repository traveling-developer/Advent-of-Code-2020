import 'package:adventofcode2020/advent_of_code_api.dart';
import 'package:trotter/trotter.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(1);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  int puzzleSolution = calculateSolution(convertedPuzzleInput, 2);

  print(puzzleSolution);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(1);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  int puzzleSolution = calculateSolution(convertedPuzzleInput, 3);

  print(puzzleSolution);
}

int calculateSolution(List<int> convertedPuzzleInput, int numberOfCombinations) {
  var combinations = Combinations(numberOfCombinations, convertedPuzzleInput);

  var searchedCombination = combinations().singleWhere((element) {
    var sum = element.reduce((left, right) => left + right);
    return sum == 2020;
  });

  var puzzleSolution = searchedCombination.reduce((left, right) => left * right);

  return puzzleSolution;
}

List<int> convertPuzzleInput(String puzzleInput) {
  var result =
      puzzleInput.split('\n').where((element) => element.isNotEmpty).map((e) => int.parse(e));

  return result.toList();
}
