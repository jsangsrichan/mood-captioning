import 'package:flutter/material.dart';

class SideLayout extends StatelessWidget {
  const SideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description =
        "Mood Captioning is an application to illustrate different emotions through subtitle!";
    return Container(
      color: const Color(0xffffffff),
      child: Expanded(
        child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          color: const Color(0xffffffff),
          child: Column(
            children: <Widget>[
              Expanded(
                child: AboutWidget(
                    title: 'MOOD CAPTIONING', description: description),
              ),
              const Expanded(child: ColorKeys()),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutWidget extends StatelessWidget {
  final String title;
  final String description;

  const AboutWidget({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'Lora',
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class ColorKeys extends StatelessWidget {
  const ColorKeys({Key? key}) : super(key: key);

  Widget makeColorKey(String mood, Color color) {
    Container colorBox = Container(
      width: 30,
      height: 10,
      color: color,
    );

    return Row(
      children: <Widget>[
        colorBox,
        const SizedBox(
          width: 10,
        ),
        Text(
          mood,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Lora',
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[
          makeColorKey('neutral', const Color(0xFFC47556)),
          const SizedBox(height: 10),
          makeColorKey('calm', const Color(0xFF3B6362)),
          const SizedBox(height: 10),
          makeColorKey('happy', const Color(0xFFDAA989)),
          const SizedBox(height: 10),
          makeColorKey('sad', const Color(0xFFB5C5BB)),
          const SizedBox(height: 10),
          makeColorKey('angry', const Color(0xFFF2E8C4)),
          const SizedBox(height: 10),
          makeColorKey('fear', const Color(0xFFC5BFA5)),
          const SizedBox(height: 10),
          makeColorKey('disgust', const Color(0xFFE3A655)),
          const SizedBox(height: 10),
          makeColorKey('pleasant surprise', const Color(0xFF87866A)),
          const SizedBox(height: 10),
          makeColorKey('boredom', const Color(0xFFB6CEF2)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
