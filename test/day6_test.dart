import 'package:adventofcode2020/day6.dart';
import 'package:test/test.dart';

void main() {
  group('day 6', () {
    var exampleInput = '''abc

a
b
c

ab
ac

a
a
a
a

b
''';

    test('convertPuzzleInput example input returns customs declaration form groups', () {
      var result = convertPuzzleInput(exampleInput);

      expect(result.length, equals(5));
    });

    test('convertPuzzleInput populates customs declaration form group', () {
      var input = '''ab
ac

b
''';
      var result = convertPuzzleInput(input);

      CustomsDeclarationFormGroup customsDeclarationFormGroup = result.first;
      expect(result.length, equals(2));
      expect(customsDeclarationFormGroup.yesAnswersPerPerson.length, equals(2));
      expect(customsDeclarationFormGroup.yesAnswersPerPerson[0], equals('ab'));
      expect(customsDeclarationFormGroup.yesAnswersPerPerson[1], equals('ac'));
    });

    test('first puzzle with example input', () {
      var convertedPuzzleInput = convertPuzzleInput(exampleInput);

      var result =
          calculateSolution(convertedPuzzleInput, (e) => e.numberOfQuestionsWithYesAnswer());

      expect(result, equals(11));
    });

    test('second puzzle with example input', () {
      var convertedPuzzleInput = convertPuzzleInput(exampleInput);

      var result = calculateSolution(
          convertedPuzzleInput, (e) => e.numberOfQuestionsEveryoneAnsweredWithYes());

      expect(result, equals(6));
    });
  });
}
