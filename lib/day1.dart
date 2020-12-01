import 'package:adventofcode2020/advent_of_code_api.dart';
import 'package:trotter/trotter.dart';

Future<void> firstPuzzle() async {
  var puzzelInput = await getPuzzelInputOfDay(1);

  var convertedPuzzelInput = convertPuzzelInput(puzzelInput);

  int puzzelSolution = calculateSolution(convertedPuzzelInput, 2);

  print(puzzelSolution);
}

Future<void> secondPuzzle() async {
  var puzzelInput = await getPuzzelInputOfDay(1);

  var convertedPuzzelInput = convertPuzzelInput(puzzelInput);

  int puzzelSolution = calculateSolution(convertedPuzzelInput, 3);

  print(puzzelSolution);
}

int calculateSolution(List<int> convertedPuzzelInput, int numberOfCombinations) {
  var combinations = Combinations(numberOfCombinations, convertedPuzzelInput);

  var searchedCombination = combinations().singleWhere((element) {
    var sum = element.reduce((left, right) => left + right);
    return sum == 2020;
  });

  var puzzelSolution = searchedCombination.reduce((left, right) => left * right);

  return puzzelSolution;
}

List<int> convertPuzzelInput(String puzzelInput) {
  var result =
      puzzelInput.split('\n').where((element) => element.isNotEmpty).map((e) => int.parse(e));

  return result.toList();
}
