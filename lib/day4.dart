import 'package:adventofcode2020/advent_of_code_api.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(4);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution = calculateSolution(convertedPuzzleInput, (e) => e.isValidFirstPuzzle());

  print(puzzleSolution);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(4);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var puzzleSolution = calculateSolution(convertedPuzzleInput, (e) => e.isValidSecondPuzzle());

  print(puzzleSolution);
}

int calculateSolution(List<Passport> convertedPuzzleInput, bool Function(Passport) mapFunction) {
  return convertedPuzzleInput.map(mapFunction).where((element) => element).length;
}

List<Passport> convertPuzzleInput(String puzzleInput) {
  var passportLines = puzzleInput.split('\n\n').map((element) => element.split('\n').join(' '));

  var passports = passportLines.map((e) {
    Map<String, String> passportData = {};

    e.split(' ').where((element) => element.isNotEmpty).forEach((element) {
      var attribute = element.split(':');
      passportData.addAll({attribute[0]: attribute[1]});
    });

    return Passport(passportData);
  });

  return passports.toList();
}

class Passport {
  Map<String, String> data;
  List<String> mandatoryFields = [
    'byr',
    'iyr',
    'eyr',
    'hgt',
    'hcl',
    'ecl',
    'pid',
  ];

  Passport(this.data);

  int get birthYear {
    return int.parse(data['byr']);
  }

  int get issueYear {
    return int.parse(data['iyr']);
  }

  int get expirationYear {
    return int.parse(data['eyr']);
  }

  String get height {
    return data['hgt'];
  }

  String get hairColor {
    return data['hcl'];
  }

  String get eyeColor {
    return data['ecl'];
  }

  String get passportId {
    return data['pid'];
  }

  bool isValidFirstPuzzle() {
    return mandatoryFields.every((element) => data.keys.contains(element));
  }

  bool isValidSecondPuzzle() {
    var containsMandatoryFields = mandatoryFields.every((element) => data.keys.contains(element));

    if (!containsMandatoryFields) {
      return false;
    }

    var birthYearValid = isBirthYearValid();
    var issueYearValid = isIssueYearValid();
    var expirationYearValid = isExpirationYearValid();
    var heightValid = isHeightValid();
    var hairColorValid = isHairColorValid();
    var eyeColorValid = isEyeColorValid();
    var passportIdValid = isPassportId();

    return birthYearValid &&
        issueYearValid &&
        expirationYearValid &&
        heightValid &&
        hairColorValid &&
        eyeColorValid &&
        passportIdValid;
  }

  bool isBirthYearValid() {
    return birthYear >= 1920 && birthYear <= 2002;
  }

  bool isIssueYearValid() {
    return issueYear >= 2010 && issueYear <= 2020;
  }

  bool isExpirationYearValid() {
    return expirationYear >= 2020 && expirationYear <= 2030;
  }

  bool isHeightValid() {
    if (height.contains('cm') || height.contains('in')) {
      var dataType = height.substring(height.length - 2, height.length);
      var value = int.parse(height.substring(0, height.length - 2));

      if (dataType == 'cm') {
        return value >= 150 && value <= 193;
      }

      if (dataType == 'in') {
        return value >= 59 && value <= 76;
      }
    }

    return false;
  }

  bool isHairColorValid() {
    final validHairColor = RegExp(r'^#([a-f0-9]{6})$');
    return validHairColor.hasMatch(hairColor);
  }

  bool isPassportId() {
    final validPassportId = RegExp(r'^\d{9}$');
    return validPassportId.hasMatch(passportId);
  }

  bool isEyeColorValid() {
    List<String> validEyeColors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'];
    return validEyeColors.contains(eyeColor);
  }
}
