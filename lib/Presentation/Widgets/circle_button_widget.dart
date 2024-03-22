import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CirclePlayButtonWidget extends StatelessWidget {
  const CirclePlayButtonWidget({
    super.key,
    required this.isPlaying,
    required this.player,
  });

  final bool isPlaying;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          icon: isPlaying
              ? const Icon(
                  Icons.pause,
                  color: Colors.white,
                  size: 50,
                )
              : const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
          onPressed: () async {
            if (isPlaying) {
              await player.pause();
            } else {
              await player.resume();
            }
          },
        ),
      ),
    );
  }
}
