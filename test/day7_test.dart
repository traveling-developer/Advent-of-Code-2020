import 'package:adventofcode2020/day7.dart';
import 'package:test/test.dart';

void main() {
  group('day 7', () {
    var exampleInput = '''light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
''';

    var secondExampleInput = '''shiny gold bags contain 2 dark red bags.
dark red bags contain 2 dark orange bags.
dark orange bags contain 2 dark yellow bags.
dark yellow bags contain 2 dark green bags.
dark green bags contain 2 dark blue bags.
dark blue bags contain 2 dark violet bags.
dark violet bags contain no other bags.
''';

    test('convertPuzzleInput example input returns bags', () {
      var result = convertPuzzleInput(exampleInput);

      expect(result.length, equals(9));
    });

    test('convertPuzzleInput one bag populates bag properties', () {
      var input = 'dark orange bags contain 3 bright white bags, 4 muted yellow bags.';

      var result = convertPuzzleInput(input).first;

      expect(result.color, equals('dark orange'));
      expect(result.bags.length, equals(7));
      expect(result.bags.where((element) => element.color == 'bright white').length, equals(3));
      expect(result.bags.where((element) => element.color == 'muted yellow').length, equals(4));
    });

    test('canHoldShinyGoldBag contains shiny gold bag returns true', () {
      var input = 'muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.';
      var bag = convertPuzzleInput(input).first;

      var result = bag.canHoldShinyGoldBag;

      expect(result, isTrue);
    });

    test('canHoldShinyGoldBag contains no shiny gold bag returns false', () {
      var input = 'dark orange bags contain 3 bright white bags, 4 muted yellow bags.';
      var bag = convertPuzzleInput(input).first;

      var result = bag.canHoldShinyGoldBag;

      expect(result, isFalse);
    });

    test('calculateFirstPuzzel example input returns 4', () {
      var input = convertPuzzleInput(exampleInput);

      var result = calculateFirstPuzzel(input);

      expect(result, equals(4));
    });

    test('calculateSecondPuzzel example input returns 32', () {
      var input = convertPuzzleInput(exampleInput);

      var result = calculateSecondPuzzel(input);

      expect(result, equals(32));
    });

    test('calculateSecondPuzzel second example input returns 126', () {
      var input = convertPuzzleInput(secondExampleInput);

      var result = calculateSecondPuzzel(input);

      expect(result, equals(126));
    });
  });
}
