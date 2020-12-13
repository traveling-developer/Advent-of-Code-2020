import 'package:adventofcode2020/advent_of_code_api.dart';

Future<void> firstPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(11);

  var waitingArea = convertPuzzleInput(puzzleInput);

  var puzzleResult = waitingArea.calculateFirstSolution();

  print(puzzleResult);
}

Future<void> secondPuzzle() async {
  var puzzleInput = await getPuzzleInputOfDay(11);

  var waitingArea = convertPuzzleInput(puzzleInput);

  var puzzleResult = waitingArea.calculateSecondSolution();

  print(puzzleResult);
}

WaitingArea convertPuzzleInput(String puzzleInput) {
  var seats = puzzleInput.split('\n').where((element) => element.isNotEmpty).map((e) {
    return e.split('').where((element) => element.isNotEmpty).map((e) {
      var isEmpty = false;
      var isFloor = false;

      if (e == '.') {
        isFloor = true;
      }
      if (e == 'L') {
        isEmpty = true;
      }

      return Seat(isEmpty, isFloor);
    }).toList();
  }).toList();

  return WaitingArea(seats);
}

class WaitingArea {
  List<List<Seat>> seats;

  WaitingArea(this.seats);

  int get length => seats.length;
  int get width => seats.first.length;

  int calculateFirstSolution() {
    while (true) {
      flagSeatsWhichNeedToBeChanged(countNumberOfOccupiedSeatsAdjacent, 4);

      int numberOfChanges = changeSeats();

      if (numberOfChanges == 0) {
        return numberOfOccupiedSeats();
      }
    }
  }

  void flagSeatsWhichNeedToBeChanged(
      int Function(int a, int b) countNumberOfOccupiedSeats, int seatTolerance) {
    for (var i = 0; i < length; i++) {
      for (var j = 0; j < width; j++) {
        var seat = seats[i][j];

        if (seat.isFloor) {
          continue;
        }

        var numberOfOccupiedSeatsAdjacent = countNumberOfOccupiedSeats(i, j);

        if (numberOfOccupiedSeatsAdjacent == 0 && seat.isEmpty) {
          seat.needsToBeChange = true;
        }

        if (numberOfOccupiedSeatsAdjacent >= seatTolerance && !seat.isEmpty) {
          seat.needsToBeChange = true;
        }
      }
    }
  }

  int changeSeats() {
    var numberOfChanges = 0;

    for (var i = 0; i < length; i++) {
      for (var j = 0; j < width; j++) {
        var seat = seats[i][j];
        if (seat.isFloor) {
          continue;
        }
        if (seat.needsToBeChange) {
          numberOfChanges++;
          seat.isEmpty = !seat.isEmpty;
          seat.needsToBeChange = false;
        }
      }
    }
    return numberOfChanges;
  }

  int numberOfOccupiedSeats() {
    var numberOfOccupiedSeats = 0;

    for (var i = 0; i < length; i++) {
      for (var j = 0; j < width; j++) {
        var seat = seats[i][j];
        if (seat.isFloor) {
          continue;
        }
        if (seat.isEmpty) {
          continue;
        }
        numberOfOccupiedSeats++;
      }
    }

    return numberOfOccupiedSeats;
  }

  int countNumberOfOccupiedSeatsAdjacent(int row, int column) {
    var numberOfOccupiedSeatsAdjacent = 0;

    for (var i = row - 1; i <= row + 1; i++) {
      for (var j = column - 1; j <= column + 1; j++) {
        if (i == row && j == column) {
          continue;
        }

        if ((i < 0 || j < 0) || (i >= length || j >= width)) {
          continue;
        }

        var seat = seats[i][j];

        if (seat.isFloor) {
          continue;
        }

        if (seat.isEmpty) {
          continue;
        }

        numberOfOccupiedSeatsAdjacent++;
      }
    }

    return numberOfOccupiedSeatsAdjacent;
  }

  int calculateSecondSolution() {
    while (true) {
      flagSeatsWhichNeedToBeChanged(countNumberOfOccupiedSeatsInView, 5);

      int numberOfChanges = changeSeats();

      if (numberOfChanges == 0) {
        return numberOfOccupiedSeats();
      }
    }
  }

  int countNumberOfOccupiedSeatsInView(int row, int column) {
    var numberOfOccupiedSeatsInView = 0;
    var directions = [
      [1, 0],
      [1, 1],
      [0, 1],
      [-1, 1],
      [-1, 0],
      [-1, -1],
      [0, -1],
      [1, -1],
    ];

    for (var item in directions) {
      var foundOccupiedSeat = isOccupiedSeatInViewOfDirection(row, column, item.first, item.last);

      if (foundOccupiedSeat) {
        numberOfOccupiedSeatsInView++;
      }
    }

    return numberOfOccupiedSeatsInView;
  }

  bool isOccupiedSeatInViewOfDirection(int row, int column, int directionX, int directionY) {
    for (var i = [row + directionY, column + directionX];
        true;
        i = [i.first + directionY, i.last + directionX]) {
      if (i.first == row && i.last == column) {
        continue;
      }

      if (i.first < 0 || i.last < 0) {
        return false;
      }

      if (i.first >= length || i.last >= width) {
        return false;
      }

      var seat = seats[i.first][i.last];

      if (seat.isFloor) {
        continue;
      }
      if (seat.isEmpty) {
        return false;
      }
      return true;
    }
  }
}

class Seat {
  bool isFloor;
  bool isEmpty;

  bool needsToBeChange = false;

  Seat(this.isEmpty, this.isFloor);
}
