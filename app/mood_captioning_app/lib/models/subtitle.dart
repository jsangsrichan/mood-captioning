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

// String sample = '''
// [
//     {
//         "text": "sample text 1",
//         "timestamp-start": "00:00",
//         "timestamp-end": "00:03",
//         "mood-code": "angry"
//     },
//     {
//         "text": "sample text 2",
//         "timestamp-start": "00:04",
//         "timestamp-end": "00:08",
//         "mood-code": "neutral"
//     },
//     {
//         "text": "sample text 3",
//         "timestamp-start": "00:09",
//         "timestamp-end": "00:11",
//         "mood-code": "happy"
//     },
//     {
//         "text": "sample text 4",
//         "timestamp-start": "00:12",
//         "timestamp-end": "00:15",
//         "mood-code": "boredom"
//     },
//     {
//         "text": "sample text 5",
//         "timestamp-start": "00:16",
//         "timestamp-end": "00:20",
//         "mood-code": "calm"
//     },
//     {
//         "text": "sample text 6",
//         "timestamp-start": "00:21",
//         "timestamp-end": "00:23",
//         "mood-code": "disgust"
//     },
//     {
//         "text": "sample text here",
//         "timestamp-start": "00:24",
//         "timestamp-end": "00:27",
//         "mood-code": "sad"
//     }
// ]
// ''';

String sample = '''
[
    {
        "text": "I'll ask Riley.",
        "timestamp-start": "00:00",
        "timestamp-end": "00:08",
        "mood-code": "calm"
    },
    {
        "text": "I don't like this!",
        "timestamp-start": "00:02",
        "timestamp-end": "00:07",
        "mood-code": "fear"
    },
    {
        "text": "This can't be a date! She's only twelve!",
        "timestamp-start": "00:03",
        "timestamp-end": "00:05",
        "mood-code": "fear"
    },
    {
        "text": "Ah, Let's probe. But! Layer it with cool words that kids say, so it's not obvious.",
        "timestamp-start": "00:06",
        "timestamp-end": "00:10",
        "mood-code": "pleasantly surprise"
    },
    {
        "text": "So! What's the dealio with Jordan? OMG, he is awesome sauce fo' sheezy!",
        "timestamp-start": "00:11",
        "timestamp-end": "00:18",
        "mood-code": "boredom"
    },
    {
        "text": "Did she just say fo sheezy",
        "timestamp-start": "00:18",
        "timestamp-end": "00:21",
        "mood-code": "disgust"
    },
    {
        "text": "I don't understand. What's happening?",
        "timestamp-start": "00:21",
        "timestamp-end": "00:23",
        "mood-code": "neutral"
    },
        {
        "text": "Ugh! This is just embarrassing. I can't. I can't.",
        "timestamp-start": "00:23",
        "timestamp-end": "00:26",
        "mood-code": "disgust"
    },
    {
        "text": "I know what you're doing here, Jordan. You don't think that I know what you know, but I know, you little punk!",
        "timestamp-start": "00:26",
        "timestamp-end": "00:37",
        "mood-code": "angry"
    },
    {
        "text": "He's not good enough for Riley. No one is!",
        "timestamp-start": "00:36",
        "timestamp-end": "00:38",
        "mood-code": "angry"
    },
    {
        "text": "Go back to jail!",
        "timestamp-start": "00:38",
        "timestamp-end": "00:41",
        "mood-code": "angry"
    },
    {
        "text": "What are you looking for, Jordan? Something to steal?",
        "timestamp-start": "00:41",
        "timestamp-end": "00:44",
        "mood-code": "fear"
    },
    {
        "text": "Like our daughter!",
        "timestamp-start": "00:44",
        "timestamp-end": "00:47",
        "mood-code": "anger"
    },
    {
        "text": "Should we say something?",
        "timestamp-start": "00:47",
        "timestamp-end": "00:49",
        "mood-code": "neutral"
    },
    {
        "text": "No no no. He'll be expecting that. Give him the silent treatment. He's about to crack, I can feel it.",
        "timestamp-start": "00:49",
        "timestamp-end": "00:53",
        "mood-code": "calm"
    }
]
''';
