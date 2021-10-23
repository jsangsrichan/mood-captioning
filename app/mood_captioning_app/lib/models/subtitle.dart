import 'package:flutter/material.dart';

class Subtitle {
  String text;
  DateTime timestampStart;
  DateTime timestampEnd;
  int moodCode;

  Subtitle(
      {required this.text,
      required this.timestampStart,
      required this.timestampEnd,
      required this.moodCode});

  factory Subtitle.fromJson(Map<String, dynamic> json) {
    return Subtitle(
        text: json['text'],
        timestampStart: json['timestampStart'],
        timestampEnd: json['timestampStart'],
        moodCode: json['moodCode']);
  }
}
