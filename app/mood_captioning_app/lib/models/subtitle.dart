import 'dart:convert';

// void main() {
//   Subtitles subtitles = Subtitles.fromJson(jsonDecode(sample));
//   print(subtitles);
// }

Subtitles getSubtitles() {
  return Subtitles.fromJson(jsonDecode(sample));
}

class Subtitles {
  final List<Subtitle> subtitles;

  Subtitles({required this.subtitles});

  factory Subtitles.fromJson(List<dynamic> parsedJson) {
    List<Subtitle> subtitles = [];
    subtitles = parsedJson.map((i) => Subtitle.fromJson(i)).toList();

    return Subtitles(subtitles: subtitles);
  }
}

class Subtitle {
  String text;
  String timestampStart;
  String timestampEnd;
  String mood;

  Subtitle(
      {required this.text,
      required this.timestampStart,
      required this.timestampEnd,
      required this.mood});

  factory Subtitle.fromJson(Map<String, dynamic> json) {
    return Subtitle(
        text: json['text'],
        timestampStart: json['timestamp-start'],
        timestampEnd: json['timestamp-end'],
        mood: json['mood-code']);
  }
}

String sample = '''
[
    {
        "text": "sample text 1",
        "timestamp-start": "00:00",
        "timestamp-end": "00:03",
        "mood-code": "angry"
    },
    {
        "text": "sample text 2",
        "timestamp-start": "00:04",
        "timestamp-end": "00:08",
        "mood-code": "neutral"
    },
    {
        "text": "sample text 3",
        "timestamp-start": "00:09",
        "timestamp-end": "00:11",
        "mood-code": "happy"
    },
    {
        "text": "sample text 4",
        "timestamp-start": "00:12",
        "timestamp-end": "00:15",
        "mood-code": "boredom"
    },
    {
        "text": "sample text 5",
        "timestamp-start": "00:16",
        "timestamp-end": "00:20",
        "mood-code": "calm"
    },
    {
        "text": "sample text 6",
        "timestamp-start": "00:21",
        "timestamp-end": "00:23",
        "mood-code": "disgust"
    },
    {
        "text": "sample text here",
        "timestamp-start": "00:24",
        "timestamp-end": "00:27",
        "mood-code": "sad"
    }
]
''';
