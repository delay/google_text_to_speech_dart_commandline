import 'dart:io';
import 'dart:convert';
import 'api.dart';

Future textToSpeech(String text, String audioFileName) async {
  if (text.isEmpty || audioFileName.isEmpty) {
    stderr.writeln(
        'error: arguments missing ( -t "say something" -f "filename")');
  } else {
    try {
      final apiResult =
          await getAudioBase64Output(text: text, file: audioFileName);
      stdout.writeln('');
      stdout.writeln('---------------------------------------');
      stdout.writeln('Output saved to: ${audioFileName}.mp3');
      stdout.writeln('---------------------------------------');

      var bytes = base64.decode(apiResult.audioContent);
      final file = File('${audioFileName}.mp3');
      await file.writeAsBytes(bytes.buffer.asUint8List());
    } catch (e) {
      stderr.writeln('error: networking error');
      stderr.writeln(e.toString());
    }
  }
}
