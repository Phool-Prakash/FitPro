import 'package:fit_pro/main.dart';
import 'package:fit_pro/testScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FinishScreen extends StatefulWidget {
  const FinishScreen({super.key});

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
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

    double scaledTextSize = 16.0 * widthScale;
    double scaledButtonHeight = 50.0 * heightScale;
    double scaledButtonWidth = 200.0 * widthScale;

    double topPosition = screenHeight * 0.41; // 41% from the top
    double leftPosition = screenWidth * 0.15; // 10% from the left
    double bottomPosition = screenHeight * 0.10; // 59% from the bottom
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/finishBg.png", fit: BoxFit.cover),
          ),
          // Positioned.fill(child: Container(color:Colors.black.withOpacity(0.6)))
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi Balam',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: const Color(0xFFA6FF00),
                        fontSize: 24.0 * heightScale,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        // height: 0.06,
                        letterSpacing: -0.72,
                      ),
                    )),
                SizedBox(height: 8.0 * heightScale),
                Text(
                  'Welcome to FitPro!\nAnswer a few questions so FitPro can best help you achieve your goal.',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0 * heightScale,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 24.0 * heightScale),
                SizedBox(
                  width: double.infinity,
                  height: 48.0 * heightScale,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(MyAppa());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA6FF00),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                    child: Text('Start Now',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: const Color(0xFF181E26),
                            fontSize: 16.0 * heightScale,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                            letterSpacing: 0.30,
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 16.0 * heightScale),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
