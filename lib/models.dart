class Request {
  Input input;
  Voice voice;
  AudioConfig audioConfig;

  Request({this.input, this.voice, this.audioConfig});

  Request.fromJson(Map<String, dynamic> json) {
    input = json['input'] != null ? Input.fromJson(json['input']) : null;
    voice = json['voice'] != null ? Voice.fromJson(json['voice']) : null;
    audioConfig = json['audioConfig'] != null
        ? AudioConfig.fromJson(json['audioConfig'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'input': input,
        'voice': voice,
        'audioConfig': audioConfig,
      };
}

class Input {
  String text;

  Input({this.text});

  Input.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() => {
        'text': text,
      };
}

class Voice {
  String languageCode;
  String name;
  String ssmlGender;

  Voice({this.languageCode, this.name, this.ssmlGender});

  Voice.fromJson(Map<String, dynamic> json) {
    languageCode = json['languageCode'];
    name = json['name'];
    ssmlGender = json['ssmlGender'];
  }

  Map<String, dynamic> toJson() => {
        'languageCode': languageCode,
        'name': name,
        'ssmlGender': ssmlGender,
      };
}

class AudioConfig {
  String audioEncoding;

  AudioConfig({this.audioEncoding});

  AudioConfig.fromJson(Map<String, dynamic> json) {
    audioEncoding = json['audioEncoding'];
  }

  Map<String, dynamic> toJson() => {
        'audioEncoding': audioEncoding,
      };
}

class AudioOutputBase64Encoded {
  String audioContent;

  AudioOutputBase64Encoded({this.audioContent});

  AudioOutputBase64Encoded.fromJson(Map<String, dynamic> json) {
    audioContent = json['audioContent'];
  }

  Map<String, dynamic> toJson() => {
        'audioContent': audioContent,
      };
}
