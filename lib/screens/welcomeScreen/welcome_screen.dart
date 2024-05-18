import 'package:fit_pro/screens/auth/singUp_email&Social/signUp_with_email/signUpEmailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({super.key});

  @override
  State<WelcomeScreens> createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
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
    double leftPosition = screenWidth * 0.06; // 10% from the left
    double bottomPosition = screenHeight * 0.10; // 59% from the bottom

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/wel.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: topPosition,
                left: leftPosition,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 18.0 * heightScale),
                        child: Text(
                          'FitPro',
                          style: TextStyle(
                            color:const Color(0xFFA6FF00),
                            fontSize: 40.0 * widthScale,
                            fontFamily: 'Orbitron',
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Welcome to FitPro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0 * widthScale,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        height: 0.03,
                      ),
                    ),
                    SizedBox(
                      height: 20.0 * heightScale,
                    ),
                    Text(
                      'Where Every Breath Counts – Empowering You to\nBreathe Easy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFD1D2D4),
                        fontSize: 14.0 * widthScale,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        // height: 0.10,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenHeight * 0.75,
                left: screenWidth * 0.10,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 312 * widthScale,
                          height: 48.0 * heightScale,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16 * widthScale,
                                  vertical: 12 * heightScale),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              backgroundColor: const Color(0xFFA6FF00),
                            ),
                            onPressed: () {
                              Get.to(const SignUpWithEmail(),
                                  transition: Transition.rightToLeftWithFade);
                            },
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF181E26),
                                fontSize: 16.0 * widthScale,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                height: 0.09,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0 * heightScale),
                        SizedBox(
                          width: 312.0 * widthScale,
                          height: 48.0 * heightScale,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0 * widthScale,
                                    vertical: 12.0 * heightScale),
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                side:
                                    const BorderSide(color: Color(0xFFA6FF00))),
                            onPressed: () {},
                            child: Text(
                              'Log In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:const Color(0xFFA6FF00),
                                fontSize: 16.0 * widthScale,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                height: 0.09,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
