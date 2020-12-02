import 'advent_of_code_api.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(2);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution =
      calculateSolution(convertedPuzzleInput, (element) => element.isValidForFirstPuzzle());

  print(puzzleSolution);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(2);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution =
      calculateSolution(convertedPuzzleInput, (element) => element.isValidForSecondPuzzle());

  print(puzzleSolution);
}

int calculateSolution(List<PasswordWithPolicy> convertedPuzzleInput,
    bool Function(PasswordWithPolicy) validationFunction) {
  return convertedPuzzleInput.where(validationFunction).length;
}

List<PasswordWithPolicy> convertPuzzleInput(String puzzleInput) {
  var result = puzzleInput.split('\n').where((element) => element.isNotEmpty).map((e) {
    var password = getPassword(e);
    var policyChar = getPolicyChar(e);
    var toNumber = getToNumber(e);
    var fromNumber = getFromNumber(e);

    return PasswordWithPolicy(password, fromNumber, toNumber, policyChar);
  });

  return result.toList();
}

String getPassword(String passwordWithPolicy) {
  var split = passwordWithPolicy.split(' ');
  return split[2];
}

String getPolicyChar(String passwordWithPolicy) {
  var split = passwordWithPolicy.split(' ');
  return split[1][0];
}

int getFromNumber(String passwordWithPolicy) {
  var split = passwordWithPolicy.split('-');
  return int.parse(split[0]);
}

int getToNumber(String passwordWithPolicy) {
  var split = passwordWithPolicy.split('-');
  var highestNumberOfOccurence = split[1].split(' ')[0];
  return int.parse(highestNumberOfOccurence);
}

class PasswordWithPolicy {
  String password;
  int fromNumber;
  int toNumber;
  String policyChar;

  PasswordWithPolicy(
    this.password,
    this.fromNumber,
    this.toNumber,
    this.policyChar,
  );

  bool isValidForFirstPuzzle() {
    var occurences = policyChar.allMatches(password).length;

    return occurences >= fromNumber && occurences <= toNumber;
  }

  bool isValidForSecondPuzzle() {
    var fromIsValid = password[fromNumber - 1] == policyChar;
    var toIsValid = password[toNumber - 1] == policyChar;

    return fromIsValid != toIsValid;
  }
}
