import 'constants.dart';
import 'models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

/*
curl -X POST 
-H "Authorization: Bearer "$(gcloud auth application-default print-access-token) 
-H "Content-Type: application/json; charset=utf-8" 
-d @request.json 
https://texttospeech.googleapis.com/v1/text:synthesize

 */

Future<AudioOutputBase64Encoded> getAudioBase64Output(
    {@required String text, String file = 'output'}) async {
  var body =
      '{"input": {"text":"$text"},"voice": {"languageCode": "$LANGUAGE_CODE", "name": "$VOICE_NAME"},"audioConfig": {"audioEncoding": "$AUDIO_ENCODING"}}';
  Future request = http.post(_getApiUrl(END_POINT), body: body);

  var response = await _getResponse(request);
  return AudioOutputBase64Encoded.fromJson(response);
}

String _getApiUrl(String endpoint) {
  return '$BASE_URL$endpoint?key=$API_KEY';
}

Future _getResponse(Future<http.Response> request) {
  return request.then((response) {
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw (jsonDecode(response.body));
  });
}
