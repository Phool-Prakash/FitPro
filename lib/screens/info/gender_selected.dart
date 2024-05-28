// import 'package:fit_pro/testScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
//
// class GenderSelected extends StatefulWidget {
//   const GenderSelected({super.key});
//
//   @override
//   State<GenderSelected> createState() => _GenderSelectedState();
// }
//
// class _GenderSelectedState extends State<GenderSelected> {
//   final int _currentStep = 0;
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
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: SvgPicture.asset(
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.cover,
//                 "assets/images/Bgimg.svg"),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: 230 * widthScale,
//                       child: StepProgressIndicator(
//                         totalSteps: 6,
//                         currentStep: _currentStep + 1,
//                         selectedColor: const Color(0xFFA6FF00),
//                         unselectedColor: Colors.grey,
//                       ),
//                     ),
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
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:fit_pro/screens/info/goal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderSelectedScreen extends StatefulWidget {

  const GenderSelectedScreen({super.key, required this.onNext});
  final VoidCallback onNext;
  @override
  State<GenderSelectedScreen> createState() => _GenderSelectedScreenState();
}

String selectedOption = '';

class _GenderSelectedScreenState extends State<GenderSelectedScreen> {
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

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80 * heightScale,
            ),
            Text(
              "Let's get started \nwith basics",
              style: TextStyle(
                fontSize: 24 * heightScale,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 48 * heightScale,
            ),
            buildOption("Male"),
            SizedBox(
              height: 10 * heightScale,
            ),
            buildOption("Female"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFA6FF00),
                    // foreground (text) color
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed:widget.onNext,
                  child: Text('Next',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          color: Color(0xFF181E26),
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                          letterSpacing: 0.30,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
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
                        fontSize: 18,
                        fontFamily: 'Sk-Modernist',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                        letterSpacing: -0.54,
                      ),
                    )),
              ),
            ],
          ),
        ));
  }

}
