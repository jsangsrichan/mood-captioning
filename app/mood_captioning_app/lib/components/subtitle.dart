import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mood_captioning_flutter/models/subtitle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: const <Widget>[
      SubtitleWidget(),
    ]);
  }
}

class SubtitleWidget extends StatefulWidget {
  const SubtitleWidget({Key? key}) : super(key: key);

  @override
  _SubtitleWidgetState createState() => _SubtitleWidgetState();
}

class _SubtitleWidgetState extends State<SubtitleWidget> {
  late String _now;
  late Timer _everySecond;
  late Color _moodColor;

  final Subtitles subtitles = getSubtitles();
  int index = 0;

  @override
  void initState() {
    super.initState();

    // _now = _timeToString(DateTime.now());
    _now = subtitles.subtitles[0].text;
    _moodColor = getMoodColor(subtitles.subtitles[0].mood);
    _everySecond = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if (!mounted) return;
      setState(() {
        // _now = _timeToString(DateTime.now());
        index = index + 1;
        _now = subtitles.subtitles[index].text;
        _moodColor = getMoodColor(subtitles.subtitles[index].mood);
      });
    });
  }

  // String _timeToString(DateTime now) {
  //   String timeString =
  //       "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  //   return timeString;
  // }

  Color getMoodColor(String mood) {
    if (mood == 'calm') {
      return const Color(0xFF3B6362);
    }
    if (mood == 'happy') {
      return const Color(0xFFDAA989);
    }
    if (mood == 'sad') {
      return const Color(0xFFB5C5BB);
    }
    if (mood == 'angry') {
      return const Color(0xFFC47556);
    }
    if (mood == 'fear') {
      return const Color(0xFFC5BFA5);
    }
    if (mood == 'disgust') {
      return const Color(0xFFE3A655);
    }
    if (mood == 'pleasant surprise') {
      return const Color(0xFF87866A);
    }
    if (mood == 'boredom') {
      return const Color(0xFFB6CEF2);
    }

    // neutral
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  _now,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: _moodColor,
                    fontFamily: 'Lora',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ))));
  }
}
