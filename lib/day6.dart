import 'package:adventofcode2020/advent_of_code_api.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(6);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution =
      calculateSolution(convertedPuzzleInput, (e) => e.numberOfQuestionsWithYesAnswer());

  print(puzzleSolution);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(6);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution =
      calculateSolution(convertedPuzzleInput, (e) => e.numberOfQuestionsEveryoneAnsweredWithYes());

  print(puzzleSolution);
}

int calculateSolution(List<CustomsDeclarationFormGroup> convertedPuzzleInput,
    int Function(CustomsDeclarationFormGroup) mapFunction) {
  return convertedPuzzleInput.map(mapFunction).reduce((value, element) => value + element);
}

List<CustomsDeclarationFormGroup> convertPuzzleInput(String puzzleInput) {
  var customsDeclarationFormGroups = puzzleInput.split('\n\n').map((element) =>
      CustomsDeclarationFormGroup(
          element.split('\n').where((element) => element.isNotEmpty).toList()));
  return customsDeclarationFormGroups.toList();
}

class CustomsDeclarationFormGroup {
  List<String> yesAnswersPerPerson;
  CustomsDeclarationFormGroup(this.yesAnswersPerPerson);

  int numberOfQuestionsWithYesAnswer() {
    var allYesAnswers = yesAnswersPerPerson.join();
    var uniqueYesAnswers = allYesAnswers.split('').toSet().toList();
    return uniqueYesAnswers.length;
  }

  int numberOfQuestionsEveryoneAnsweredWithYes() {
    var numberOfPersons = yesAnswersPerPerson.length;
    var allYesAnswers = yesAnswersPerPerson.join().split('');

    List<String> questionsAnsweredByAllWithYes = [];

    allYesAnswers.forEach((element) {
      var numberOfPersonsAnswerQuestionWithYes = allYesAnswers.where((e) => e == element).length;
      if (numberOfPersonsAnswerQuestionWithYes == numberOfPersons &&
          !questionsAnsweredByAllWithYes.contains(element)) {
        questionsAnsweredByAllWithYes.add(element);
      }
    });

    return questionsAnsweredByAllWithYes.length;
  }
}
