import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> getPuzzleInputOfDay(int day) async {
  String sessionCookie = await readSessionCookieFromConfigFile();

  dynamic puzzleInput = await http.read(
    'https://adventofcode.com/2020/day/' + day.toString() + '/input',
    headers: {'Cookie': sessionCookie},
  );

  return puzzleInput.toString();
}

Future<String> readSessionCookieFromConfigFile() async {
  var rawConfigContent = await File('config.txt').readAsString();

  return rawConfigContent;
}
