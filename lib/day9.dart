import 'dart:math';

import 'package:adventofcode2020/advent_of_code_api.dart';
import 'package:trotter/trotter.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(9);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);
  var preambleLength = 25;
  var considerLast = 25;
  var puzzleSolution = calculateFirstSolution(convertedPuzzleInput, preambleLength, considerLast);

  print(puzzleSolution);
}

int calculateFirstSolution(List<int> convertedPuzzleInput, int preambleLength, int considerLast) {
  for (var i = preambleLength; i < convertedPuzzleInput.length; i++) {
    var isValid = isNumberOfTwoNumbersInList(
        convertedPuzzleInput.sublist(i - considerLast, i), convertedPuzzleInput[i]);

    if (isValid == false) {
      return convertedPuzzleInput[i];
    }
  }
  return 0;
}

bool isNumberOfTwoNumbersInList(List<int> list, int number) {
  var combinations = Combinations(2, list);

  var searchedCombination = combinations().where((element) {
    var sum = element.reduce((left, right) => left + right);
    return sum == number;
  }).toList();

  return searchedCombination.isNotEmpty;
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(9);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);
  var searchNumber = 373803594;

  var puzzleSolution = calculateSecondSolution(convertedPuzzleInput, searchNumber);

  print(puzzleSolution);
}

int calculateSecondSolution(List<int> convertedPuzzleInput, int searchedNumber) {
  var listUntilSearchedNumber =
      convertedPuzzleInput.sublist(0, convertedPuzzleInput.indexOf(searchedNumber));

  var numbers = 2;

  while (true) {
    for (var i = 0; i < listUntilSearchedNumber.length; i++) {
      if (i + numbers > listUntilSearchedNumber.length) {
        break;
      }

      var sublist = listUntilSearchedNumber.sublist(i, i + numbers).toList();
      var sum = sublist.reduce((value, element) => value + element);

      if (sum == searchedNumber) {
        var smallest = sublist.reduce(min);
        var highest = sublist.reduce(max);

        return smallest + highest;
      }
    }

    numbers++;
  }
}

List<int> convertPuzzleInput(String puzzleInput) {
  var arguments = puzzleInput.split('\n').where((element) => element.isNotEmpty).map((e) {
    return int.parse(e);
  }).toList();

  return arguments;
}
