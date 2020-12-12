import 'package:adventofcode2020/advent_of_code_api.dart';
import 'package:tuple/tuple.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(8);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution = calculateFirstSolution(convertedPuzzleInput);

  print(puzzleSolution.item1);
}

Tuple2<int, bool> calculateFirstSolution(List<Instruction> convertedPuzzleInput) {
  int accumulator = 0;

  var looped = false;

  for (var i = 0; i < convertedPuzzleInput.length; i) {
    if (convertedPuzzleInput[i].wasExecuted) {
      looped = true;
      break;
    }

    convertedPuzzleInput[i].wasExecuted = true;
    if (convertedPuzzleInput[i].operation == 'nop') {
      i++;
      continue;
    }

    if (convertedPuzzleInput[i].operation == 'acc') {
      accumulator = accumulator + convertedPuzzleInput[i].argument;
      i++;
      continue;
    }

    if (convertedPuzzleInput[i].operation == 'jmp') {
      i = i + convertedPuzzleInput[i].argument;
      continue;
    }
  }

  return Tuple2(accumulator, looped);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(8);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzelSolution = calculateSecondSolution(convertedPuzzleInput);

  print(puzzelSolution);
}

int calculateSecondSolution(List<Instruction> convertedPuzzleInput) {
  for (var item in convertedPuzzleInput) {
    var copyOfInstructions = convertedPuzzleInput.map((e) => Instruction.from(e)).toList();

    var itemIndex = convertedPuzzleInput.indexOf(item);

    swapOperation(copyOfInstructions[itemIndex]);

    var result = calculateFirstSolution(copyOfInstructions);

    if (result.item2 == false) {
      return result.item1;
    }
  }

  return 0;
}

void swapOperation(Instruction instruction) {
  if (instruction.operation == 'jmp') {
    instruction.operation = 'nop';
  } else if (instruction.operation == 'nop') {
    instruction.operation = 'jmp';
  }
}

List<Instruction> convertPuzzleInput(String puzzleInput) {
  var arguments = puzzleInput.split('\n').where((element) => element.isNotEmpty).map((e) {
    var instructionParts = e.split(' ');
    return Instruction(instructionParts[0], int.parse(instructionParts[1]));
  }).toList();

  return arguments;
}

class Instruction {
  String operation;
  int argument;
  bool wasExecuted = false;

  Instruction(this.operation, this.argument);

  Instruction.from(Instruction instruction) {
    operation = instruction.operation;
    argument = instruction.argument;
    wasExecuted = instruction.wasExecuted;
  }
}
