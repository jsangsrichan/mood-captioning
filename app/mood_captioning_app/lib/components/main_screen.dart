import 'package:flutter/material.dart';
import 'package:mood_captioning_flutter/components/chewie_list_item.dart';
import 'package:mood_captioning_flutter/components/subtitle.dart';
import 'package:video_player/video_player.dart';

import 'side_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2F3F7),
      ),
      title: 'Flutter Demo',
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F3F7),
      child: Row(children: const <Widget>[
        Expanded(child: SideLayout()),
        Expanded(
          flex: 4,
          child: View(),
        ),
      ]),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFFF2F3F7),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: ChewieListItem(
                videoPlayerController: VideoPlayerController.network(
                  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                ),
                looping: true,
              ),
            ),
            // Expanded(
            //   child: ChewieListItem(
            //     videoPlayerController: VideoPlayerController.asset(
            //       'assets/test_clip.mp4',
            //     ),
            //     looping: true,
            //   ),
            // ),
            const SubtitleView(),
          ],
        ),
      ),
    );
  }
}

class SubtitleView extends StatelessWidget {
  const SubtitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 35, bottom: 40),
      child: Column(children: const <Widget>[
        SubtitleWidget(),
      ]),
    );
  }
}
