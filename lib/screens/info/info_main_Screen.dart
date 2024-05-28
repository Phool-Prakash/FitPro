import 'package:fit_pro/screens/info/gender_selected.dart';
import 'package:fit_pro/screens/info/goal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class InfoMainScreen extends StatefulWidget {
  const InfoMainScreen({super.key});

  @override
  State<InfoMainScreen> createState() => _InfoMainScreenState();
}

class _InfoMainScreenState extends State<InfoMainScreen> {
  late int _currentStep = 0;

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) _currentStep++;
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 0) _currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    ///Scaling Factor
    double baseHeight = isPortrait ? 720.0 : 360.0;
    double baseWidth = isPortrait ? 360.0 : 720.0;
    double heightScale = screenHeight / baseHeight;
    double widthScale = screenWidth / baseWidth;

    Widget screen;
    switch (_currentStep) {
      case 0:
        screen = GenderSelectedScreen(onNext: _nextStep);
        break;
      case 1:
        screen = GoalScreen();
        break;
      case 2:
        screen = FirstScreen(onNext: _previousStep);
        break;
      default:
        screen = FirstScreen(onNext: _nextStep);
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                "assets/images/Bgimg.svg"),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 230 * widthScale,
                      child: StepProgressIndicator(
                        totalSteps: 6,
                        currentStep: _currentStep + 1,
                        selectedColor: const Color(0xFFA6FF00),
                        unselectedColor: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text('Skip',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: const Color(0xFFD1D2D4),
                              fontSize: 16 * heightScale,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 0.09,
                              letterSpacing: 0.30,
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(child: screen)
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final VoidCallback onNext;

  const FirstScreen({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Positioned.fill(
            child: Text(
              "Let's get started\nwith basics",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: onNext,
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
    );
  }
}

class SecondScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const SecondScreen({Key? key, required this.onNext, required this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Expanded(
          child: Center(
            child: Text('Second Screen Content'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onBack,
                child: Text('Back'),
              ),
              ElevatedButton(
                onPressed: onNext,
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
