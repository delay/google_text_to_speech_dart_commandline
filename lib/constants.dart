const API_KEY = 'Your API Key';
const BASE_URL = 'https://texttospeech.googleapis.com/v1/';
const VOICE_NAME = 'en-US-Wavenet-D';
const AUDIO_ENCODING = 'MP3';
const LANGUAGE_CODE = 'en-us';
const SSML_GENDER = 'MALE';
const END_POINT = 'text:synthesize';

/*
curl -X POST -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) -H "Content-Type: application/json; charset=utf-8" -d @request.json https://texttospeech.googleapis.com/v1/text:synthesize

 */
