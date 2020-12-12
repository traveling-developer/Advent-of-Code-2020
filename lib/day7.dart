import 'advent_of_code_api.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(7);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var numberOfPossibleBags = calculateFirstPuzzel(convertedPuzzleInput);

  print(numberOfPossibleBags);
}

int calculateFirstPuzzel(List<Bag> convertedPuzzleInput) {
  var bagsThatCanHoldAshinyGoldBag =
      convertedPuzzleInput.where((e) => e.canHoldShinyGoldBag).toList();

  bagsThatCanHoldAshinyGoldBag.forEach((element) {
    element.alreadyCounted = true;
  });

  var colorsThatCanHoldAshinyGoldBag = bagsThatCanHoldAshinyGoldBag.map((e) => e.color).toList();

  var numberOfBagsContainingBagsOfColors =
      countNumberOfBagsContainingBagsOfColors(convertedPuzzleInput, colorsThatCanHoldAshinyGoldBag);

  return numberOfBagsContainingBagsOfColors + bagsThatCanHoldAshinyGoldBag.length;
}

int countNumberOfBagsContainingBagsOfColors(List<Bag> convertedPuzzleInput, List<String> colors) {
  var bagsContainingBagsOfColors = convertedPuzzleInput
      .where((element) =>
          element.bags.where((e) => colors.contains(e.color)).isNotEmpty && !element.alreadyCounted)
      .toList();

  var colorsContainingBagsOfColors = bagsContainingBagsOfColors.map((e) => e.color);
  colors.addAll(colorsContainingBagsOfColors);

  bagsContainingBagsOfColors.forEach((element) {
    element.alreadyCounted = true;
  });

  if (bagsContainingBagsOfColors.isEmpty) {
    return 0;
  }

  return bagsContainingBagsOfColors.length +
      countNumberOfBagsContainingBagsOfColors(convertedPuzzleInput, colors);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(7);

  var convertedPuzzleInput = convertPuzzleInput(puzzleInput);

  var numberOfIndividualBags = calculateSecondPuzzel(convertedPuzzleInput);

  print(numberOfIndividualBags);
}

int calculateSecondPuzzel(List<Bag> convertedPuzzleInput) {
  var shinyGoldBag = convertedPuzzleInput.firstWhere((element) => element.color == 'shiny gold');

  int numberOfIndividualBags = 0;

  shinyGoldBag.bags.forEach((element) {
    numberOfIndividualBags =
        numberOfIndividualBags + calculateNumberOfBags(convertedPuzzleInput, element) + 1;
  });

  return numberOfIndividualBags;
}

int calculateNumberOfBags(List<Bag> convertedPuzzleInput, Bag bag) {
  var bagOfColor = convertedPuzzleInput.firstWhere((element) => element.color == bag.color);

  int numberOfIndividualBags = 0;

  bagOfColor.bags.forEach((element) {
    numberOfIndividualBags =
        numberOfIndividualBags + calculateNumberOfBags(convertedPuzzleInput, element) + 1;
  });

  if (bagOfColor.bags.isEmpty) {
    return 0;
  }

  return numberOfIndividualBags;
}

List<Bag> convertPuzzleInput(String puzzleInput) {
  var bags = puzzleInput.split('\n').where((element) => element.isNotEmpty).map((e) {
    var bagAndContent = e.split('contain');
    String color = getColor(bagAndContent[0]);
    List<Bag> content = getContent(bagAndContent[1]);

    var bag = Bag(color);
    bag.bags = content;

    return bag;
  }).toList();

  return bags;
}

List<Bag> getContent(String bagAndContent) {
  List<Bag> content = [];
  bagAndContent.split(',').forEach((element) {
    var bagParts = element.split(' ').where((element) => element.isNotEmpty).toList();
    if (bagParts[0] == 'no') {
      return;
    }

    var numberOfBags = int.parse(bagParts[0]);

    for (var i = 0; i < numberOfBags; i++) {
      content.add(Bag(bagParts[1] + ' ' + bagParts[2]));
    }
  });

  return content;
}

String getColor(String bag) {
  var color = bag.split('bags')[0].trim();
  return color;
}

class Bag {
  String color;
  List<Bag> bags = [];
  Bag(this.color);

  bool alreadyCounted = false;

  bool get canHoldShinyGoldBag {
    var shinyGoldBags = bags.where((element) => element.isShinyGoldBag);
    return shinyGoldBags.isNotEmpty;
  }

  bool get isShinyGoldBag {
    return color == 'shiny gold';
  }
}
