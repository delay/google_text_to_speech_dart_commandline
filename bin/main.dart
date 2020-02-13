import 'dart:io';
import 'package:args/args.dart';
import 'package:text_to_speech/text_to_speech.dart';

void main(List<String> arguments) {
  exitCode = 0;
  //add our commandline options for the script
  final parser = ArgParser()
    ..addOption('text', abbr: 't')
    ..addOption('file', abbr: 'f', defaultsTo: 'output');

  final argResults = parser.parse(arguments);
  //process our commandline arguments with to get our text to speech result
  textToSpeech(argResults['text'], argResults['file']);
}
