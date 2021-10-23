import 'dart:convert';

import 'package:flutter/material.dart';

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
  int moodCode;

  Subtitle(
      {required this.text,
      required this.timestampStart,
      required this.timestampEnd,
      required this.moodCode});

  factory Subtitle.fromJson(Map<String, dynamic> json) {
    return Subtitle(
        text: json['text'],
        timestampStart: json['timestamp-start'],
        timestampEnd: json['timestamp-end'],
        moodCode: json['mood-code']);
  }
}
