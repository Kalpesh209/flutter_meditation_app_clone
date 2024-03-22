import 'package:flutter/material.dart';
import 'package:flutter_meditation_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_meditation_app_clone/AppUtils/app_text_style.dart';
import 'package:flutter_meditation_app_clone/Presentation/Screens/dash_board_screen.dart';
import 'package:flutter_meditation_app_clone/Presentation/Widgets/rectangle_button_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/meditation.png"),
              const Text(
                AppStrings.ktimeToMeditate,
                style: AppTextStyle.kLargeTextStyle,
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  AppStrings.ktakeBreath,
                  style: AppTextStyle.kMeduimTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              RectangleButtonWidget(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    )),
                child: const Text(
                  AppStrings.kgetStarted,
                  style: AppTextStyle.kButtonTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
