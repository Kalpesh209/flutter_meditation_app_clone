import 'package:flutter/material.dart';
import 'package:flutter_meditation_app_clone/AppUtils/app_images.dart';
import 'package:flutter_meditation_app_clone/AppUtils/app_music.dart';
import 'package:flutter_meditation_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_meditation_app_clone/AppUtils/app_text_style.dart';
import 'package:flutter_meditation_app_clone/Presentation/Screens/song_board_screen.dart';
import 'package:flutter_meditation_app_clone/Presentation/Widgets/meditation_card_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text(
                    AppStrings.kHeySweetie,
                    style: AppTextStyle.kMeduimTextStyle,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  AppStrings.kWhatsYourMood,
                  style: AppTextStyle.kMeduimTextStyle,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: [
                    MeditationCardWidget(
                      title: AppStrings.kMeditateTitle,
                      description: AppStrings.kMeditateSubtitle,
                      image: AppImages.kMeditateImageSource,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SongBoardScreen(
                              musicName: AppStrings.kMeditateTitle,
                              imageSource: AppImages.kMeditateImageSource,
                              musicSource: AppMusic.kMeditateMusicSource,
                            ),
                          ),
                        );
                      },
                    ),
                    MeditationCardWidget(
                      title: AppStrings.kRelaxTitle,
                      description: AppStrings.kRelaxSubtitle,
                      image: AppImages.kRelaxImageSource,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SongBoardScreen(
                              musicName: AppStrings.kRelaxTitle,
                              imageSource: AppImages.kRelaxImageSource,
                              musicSource: AppMusic.kRelaxMusicSource,
                            ),
                          ),
                        );
                      },
                    ),
                    MeditationCardWidget(
                      title: AppStrings.kBrainTitle,
                      description: AppStrings.kBrainSubtitle,
                      image: AppImages.kBrainImageSource,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SongBoardScreen(
                              musicName: AppStrings.kBrainTitle,
                              imageSource: AppImages.kBrainImageSource,
                              musicSource: AppMusic.kBrainMusicSource,
                            ),
                          ),
                        );
                      },
                    ),
                    MeditationCardWidget(
                      title: AppStrings.kStudyTitle,
                      description: AppStrings.kStudySubtitle,
                      image: AppImages.kStudyImageSource,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SongBoardScreen(
                              musicName: AppStrings.kStudyTitle,
                              imageSource: AppImages.kStudyImageSource,
                              musicSource: AppMusic.kStudyMusicSource,
                            ),
                          ),
                        );
                      },
                    ),
                    MeditationCardWidget(
                      title: AppStrings.kSleepTitle,
                      description: AppStrings.kSleepSubtitle,
                      image: AppImages.kSleepImageSource,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SongBoardScreen(
                              musicName: AppStrings.kSleepTitle,
                              imageSource: AppImages.kSleepImageSource,
                              musicSource: AppMusic.kSleepMusicSource,
                            ),
                          ),
                        );
                      },
                    ),
                    MeditationCardWidget(
                      title: AppStrings.kFocusTitle,
                      description: AppStrings.kFocusSubtitle,
                      image: AppImages.kFocusImageSource,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SongBoardScreen(
                              musicName: AppStrings.kFocusTitle,
                              imageSource: AppImages.kFocusImageSource,
                              musicSource: AppMusic.kFocusMusicSource,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
