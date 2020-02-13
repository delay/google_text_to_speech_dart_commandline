import 'dart:io';
import 'dart:convert';
import 'constants.dart';
import 'models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

Future textToSpeech(String text, String audioFileName) async {
  //if user fails to add arguments to commandline output error message
  if (text == null || text == '') {
    stderr.writeln(
        'error: arguments missing ( -t "say something" -f "filename")');
  } else {
    try {
      //query google voice api and get response which is base 64 encoded.
      final apiResult =
          await _getAudioBase64Output(text: text, file: audioFileName);
      stdout.writeln('');
      stdout.writeln('---------------------------------------');
      stdout.writeln('Output saved to: ${audioFileName}.mp3');
      stdout.writeln('---------------------------------------');
      //decode base64 file and save as binary audio file (mp3)
      var bytes = base64.decode(apiResult.audioContent);
      var fileType = AUDIO_ENCODING.toLowerCase();
      final file = File('${audioFileName}.${fileType}');
      await file.writeAsBytes(bytes.buffer.asUint8List());
    } catch (e) {
      //output error
      stderr.writeln('error: networking error');
      stderr.writeln(e.toString());
    }
  }
}

Future<AudioOutputBase64Encoded> _getAudioBase64Output(
    {@required String text, String file = 'output'}) async {
  //create api URL from global constants
  var _apiURL = '$BASE_URL$END_POINT?key=$API_KEY';
  //create json body from global constants and input variables
  var body =
      '{"input": {"text":"$text"},"voice": {"languageCode": "$LANGUAGE_CODE", "name": "$VOICE_NAME"},"audioConfig": {"audioEncoding": "$AUDIO_ENCODING"}}';

  //send post request to google text to speech api
  Future request = http.post(_apiURL, body: body);
  //get response
  var response = await _getResponse(request);
  //return our mapped response from our AudioOutputBase64Encoded model
  return AudioOutputBase64Encoded.fromJson(response);
}

Future _getResponse(Future<http.Response> request) {
  //return our response if good (200 code) or throw error if failed
  return request.then((response) {
    //print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw (jsonDecode(response.body));
  });
}
