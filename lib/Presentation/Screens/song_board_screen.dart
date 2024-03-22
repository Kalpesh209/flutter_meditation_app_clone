import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_meditation_app_clone/AppUtils/app_text_style.dart';
import 'package:flutter_meditation_app_clone/Presentation/Widgets/circle_button_widget.dart';
import 'package:flutter_meditation_app_clone/Presentation/Widgets/rectangle_button_widget.dart';

class SongBoardScreen extends StatefulWidget {
  final String musicName;
  final String musicSource;
  final String imageSource;
  const SongBoardScreen({
    super.key,
    required this.musicName,
    required this.musicSource,
    required this.imageSource,
  });

  @override
  State<SongBoardScreen> createState() => _SongBoardState();
}

class _SongBoardState extends State<SongBoardScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String musicName = '';
  String musicSource = '';
  String imageSource = '';

  @override
  void initState() {
    super.initState();
    updateUI(
      widget.musicName,
      widget.musicSource,
      widget.imageSource,
    );

    setAudio();
    // listion to state playing, paused, stop
    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    // Listen to duration position
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    // listen to audion position
    player.onPositionChanged.listen((newPostion) {
      setState(() {
        position = newPostion;
      });
    });
  }

  void updateUI(
    String newMusicName,
    String newMusicSource,
    String newImageSource,
  ) {
    musicName = newMusicName;
    musicSource = newMusicSource;
    imageSource = newImageSource;
    return;
  }

  Future setAudio() async {
    AssetSource source = AssetSource('musics/$musicSource');
    await player.play(source);
    // repeat the music
    player.setReleaseMode(ReleaseMode.loop);
    player.setSource(source);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/$imageSource',
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    musicName,
                    style: AppTextStyle.kLargeTextStyle,
                  ),
                  Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    activeColor: Colors.deepPurple,
                    inactiveColor: Colors.deepPurple[200],
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await player.seek(position);
                      await player.resume();
                    },
                  ),
                  CirclePlayButtonWidget(isPlaying: isPlaying, player: player),
                  const SizedBox(
                    height: 120,
                  ),
                  RectangleButtonWidget(
                    onPressed: () async {
                      await player.stop();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "GO TO DASHBOARD",
                      style: AppTextStyle.kButtonTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
