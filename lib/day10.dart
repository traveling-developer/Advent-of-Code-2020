import 'package:adventofcode2020/advent_of_code_api.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(10);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution = calculateFirstSolution(convertedPuzzleInput);

  print(puzzleSolution);
}

int calculateFirstSolution(List<int> convertedPuzzleInput) {
  var numberOfOnes = 1;
  var numberOfThrees = 1;

  convertedPuzzleInput.sort();

  var currentNumber = convertedPuzzleInput.first;

  while (true) {
    var indexOfOne = convertedPuzzleInput.indexOf(currentNumber + 1);
    var indexOfThree = convertedPuzzleInput.indexOf(currentNumber + 3);

    if (indexOfOne != -1) {
      currentNumber = convertedPuzzleInput[indexOfOne];
      numberOfOnes++;
      continue;
    }

    if (indexOfThree != -1) {
      currentNumber = convertedPuzzleInput[indexOfThree];
      numberOfThrees++;
      continue;
    }

    break;
  }

  return numberOfOnes * numberOfThrees;
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(10);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution = calculateSecondSolution(convertedPuzzleInput);

  print(puzzleSolution);
}

int calculateSecondSolution(List<int> convertedPuzzleInput) {
  convertedPuzzleInput.add(0);
  convertedPuzzleInput.sort();

  var differentials = calculateDifferentials(convertedPuzzleInput);
  var jumpables = calculateJumpableAdapters(differentials);
  var numberOfPossibleChains = calculatePossibleChains(jumpables);

  return numberOfPossibleChains;
}

List<int> calculateDifferentials(List<int> convertedPuzzleInput) {
  List<int> differentials = [];

  for (var i = 1; i < convertedPuzzleInput.length; i++) {
    differentials.add(convertedPuzzleInput[i] - (convertedPuzzleInput[i - 1]));
  }

  return differentials;
}

List<int> calculateJumpableAdapters(List<int> differentials) {
  List<int> jumpables = [];

  int jumpable = 0;

  for (var item in differentials) {
    if (item == 1) {
      jumpable++;
    } else if (item == 3) {
      jumpables.add(jumpable);
      jumpable = 0;
    }
  }

  jumpables.add(jumpable);

  return jumpables;
}

int calculatePossibleChains(List<int> jumpables) {
  int product = 1;

  for (var item in jumpables) {
    product *= calculateFactor(item);
  }
  return product;
}

int calculateFactor(int jumpable) {
  switch (jumpable) {
    case 2:
      return 2;
    case 3:
      return 4;
    case 4:
      return 7;
    default:
      return 1;
  }
}

List<int> convertPuzzleInput(String puzzleInput) {
  var arguments = puzzleInput.split('\n').where((element) => element.isNotEmpty).map((e) {
    return int.parse(e);
  }).toList();

  return arguments;
}
