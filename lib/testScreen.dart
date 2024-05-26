import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
//
// class GenderSelection extends StatefulWidget {
//   const GenderSelection({super.key});
//
//   @override
//   State<GenderSelection> createState() => _GenderSelectionState();
// }
//
// String selectedOption = '';
//
//
// class _GenderSelectionState extends State<GenderSelection> {
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//
//     ///Scaling Factor
//     double baseHeight = isPortrait ? 720.0 : 360.0;
//     double baseWidth = isPortrait ? 360.0 : 720.0;
//     double heightScale = screenHeight / baseHeight;
//     double widthScale = screenWidth / baseWidth;
//
//     double scaledTextSize = 16.0 * widthScale;
//     double scaledButtonHeight = 50.0 * heightScale;
//     double scaledButtonWidth = 200.0 * widthScale;
//
//     double topPosition = screenHeight * 0.41; // 41% from the top
//     double leftPosition = screenWidth * 0.15; // 10% from the left
//     double bottomPosition = screenHeight * 0.10; // 59% from the bottom
//     return SafeArea(
//         child: Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: SvgPicture.asset(
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.cover,
//                 "assets/images/Bgimg.svg"),
//           ),
//           Positioned.fill(
//               child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                         width: 250 * widthScale,
//                         height: 4 * heightScale,
//                         child: StepProgressIndicator(
//                           totalSteps: 6,
//                         )),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text('Skip',
//                           style: GoogleFonts.openSans(
//                             textStyle: TextStyle(
//                               color: const Color(0xFFD1D2D4),
//                               fontSize: 16 * heightScale,
//                               fontFamily: 'Open Sans',
//                               fontWeight: FontWeight.w700,
//                               height: 0.09,
//                               letterSpacing: 0.30,
//                             ),
//                           )),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 32 * heightScale,
//                 ),
//                 Text('Let’s get started with\nbasics',
//                     style: GoogleFonts.openSans(
//                       textStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24 * heightScale,
//                         fontFamily: 'Open Sans',
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: -0.72,
//                       ),
//                     )),
//                 const SizedBox(
//                   height: 32,
//                 ),
//                 buildOption('Male'),
//                 buildOption('Female'),
//               ],
//             ),
//           )),
//         ],
//       ),
//     ));
//   }
//
//   Widget buildOption(String option) {
//     return GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedOption = option;
//           });
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             width: 295,
//             height: 58,
//             decoration: ShapeDecoration(
//                 shape: RoundedRectangleBorder(
//               side: BorderSide(
//                   width: 1,
//                   color: selectedOption == option
//                       ? const Color(0xFFA6FF00)
//                       : const Color(0xFF3F4F64)),
//               borderRadius: BorderRadius.circular(8),
//             )),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     width: 20,
//                     height: 20,
//                     decoration: ShapeDecoration(
//                       shape: OvalBorder(
//                         side: BorderSide(
//                             width: 6,
//                             color: selectedOption == option
//                                 ? const Color(0xFFA6FF00)
//                                 : const Color(0xFF8B8E92)),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15.0),
//                   child: Text(option,
//                       style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                           color: selectedOption == option
//                               ? Colors.white
//                               : const Color(0xFF8B8E92),
//                           fontSize: 18,
//                           fontFamily: 'Sk-Modernist',
//                           fontWeight: FontWeight.w700,
//                           height: 0.09,
//                           letterSpacing: -0.54,
//                         ),
//                       )),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

class MyAppa extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppa> {
  int _currentStep = 0;

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
        screen = FirstScreen(onNext: _nextStep);
        break;
      case 1:
        screen = SecondScreen(onNext: _nextStep, onBack: _previousStep);
        break;
      case 2:
        screen = ThirdScreen(onBack: _previousStep);
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
          Positioned.fill(
            top: 50 * heightScale,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200 * widthScale,
                      child: StepProgressIndicator(
                        totalSteps: 6,
                        currentStep: _currentStep + 1,
                        selectedColor: Color(0xFFA6FF00),
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
                ),
              ),
            ),
          ),
          Positioned.fill(top: 100, child: Expanded(child: screen)),
        ],
      ),
    );
  }
}

///First Screen

class FirstScreen extends StatefulWidget {
  final VoidCallback onNext;

  const FirstScreen({Key? key, required this.onNext}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

String selectedOption = '';

class _FirstScreenState extends State<FirstScreen> {
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

    return Padding(
      padding: const EdgeInsets.only(left:18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30 * heightScale,),
          Text('Let’s get started with\nbasics',
              style: GoogleFonts.openSans(
                textStyle:TextStyle(
                  color: Colors.white,
                  fontSize: 24 * heightScale,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.72,
                ),
              )),
          SizedBox(
            height: 32 * heightScale,
          ),
          buildOption('Male'),
          buildOption('Female'),
          SizedBox(height: 200 * heightScale,),
          Expanded(
            child: ElevatedButton(
              onPressed: widget.onNext,
              child: const Text('First'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOption(String option) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = option;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: Container(
            width: 295,
            height: 58,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: selectedOption == option
                      ? const Color(0xFFA6FF00)
                      : const Color(0xFF3F4F64)),
              borderRadius: BorderRadius.circular(8),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(
                            width: 6,
                            color: selectedOption == option
                                ? const Color(0xFFA6FF00)
                                : const Color(0xFF8B8E92)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(option,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: selectedOption == option
                              ? Colors.white
                              : const Color(0xFF8B8E92),
                          fontSize: 18 ,
                          fontFamily: 'Sk-Modernist',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                          letterSpacing: -0.54,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}

///Second Screen

class SecondScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const SecondScreen({Key? key, required this.onNext, required this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onNext,
              child: Text('Second'),
            ),
            ElevatedButton(
              onPressed: onBack,
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

///Third Screen

class ThirdScreen extends StatelessWidget {
  final VoidCallback onBack;

  const ThirdScreen({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: onBack,
            child: Text('Back'),
          ),
        ),
      ),
    );
  }
}
