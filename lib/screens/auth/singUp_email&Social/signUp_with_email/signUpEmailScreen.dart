import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../signUp_social/domain/facebookAuth/facebookAuth_helper.dart';
import '../signUp_social/domain/googleAuth/googleAuth_helper.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
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
          SvgPicture.asset(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              "assets/images/Bgimg.svg"),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: heightScale * 40,
              ),
              Text(
                'FitPro',
                style: GoogleFonts.orbitron(
                    textStyle: TextStyle(
                  color: const Color(0xFFA6FF00),
                  fontSize: 40.0 * widthScale,
                  fontWeight: FontWeight.w900,
                  height: 0,
                )),
              ),
              SizedBox(
                height: heightScale * 50,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      onTapBtnGoogle();
                    },
                    child: Container(
                      width: 312.0 * widthScale,
                      height: 48.0 * heightScale,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0 * widthScale,
                          vertical: 12.0 * heightScale),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.0 * widthScale,
                                color: const Color(0xFF516580),
                              ),
                              borderRadius: BorderRadius.circular(100))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Google.png"),
                          SizedBox(
                            width: 40.0 * widthScale,
                          ),
                          Text('Continue with Google',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0 * widthScale,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0.09 * heightScale,
                                  letterSpacing: 0.30,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0 * heightScale,
                  ),
                  InkWell(
                    onTap: () {
                      onTapBtnFacebook();
                    },
                    child: Container(
                      width: 312.0 * widthScale,
                      height: 48.0 * heightScale,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0 * widthScale,
                          vertical: 12.0 * heightScale),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.0 * widthScale,
                                color: const Color(0xFF516580),
                              ),
                              borderRadius: BorderRadius.circular(100))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Facebook.png"),
                          SizedBox(
                            width: 40.0 * widthScale,
                          ),
                          Text('Continue with Facebook',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0 * widthScale,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0.09 * heightScale,
                                  letterSpacing: 0.30,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0 * heightScale,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 312.0 * widthScale,
                      height: 48.0 * heightScale,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0 * widthScale,
                          vertical: 12.0 * heightScale),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.0 * widthScale,
                                color: const Color(0xFF516580),
                              ),
                              borderRadius: BorderRadius.circular(100))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Apple.png"),
                          SizedBox(
                            width: 40.0 * widthScale,
                          ),
                          Text('Continue with Apple',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0 * widthScale,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0.09 * heightScale,
                                  letterSpacing: 0.30,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0 * heightScale,
                  ),
                  Text('OR',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: const Color(0xFFD1D2D4),
                          fontSize: 16.0 * widthScale,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.09 * heightScale,
                        ),
                      )),
                  SizedBox(
                    height: 48.0 * heightScale,
                  ),
                  SizedBox(
                    width: 312.0 * widthScale,
                    height: 48.0 * heightScale,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0 * widthScale,
                            vertical: 12.0 * heightScale),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: const Color(0xFFA6FF00),
                      ),
                      onPressed: () {
                        Get.to(const SignUpWithEmail(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      child: Text(
                        'Continue with Email',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF181E26),
                          fontSize: 16.0 * widthScale,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          height: 0.09 * heightScale,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 150.0 * heightScale,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('By continuing forward, you agree to FitPro’s',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Color(0xFF8B8E92),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.20,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            disabledBackgroundColor: Colors.transparent),
                        onPressed: () {},
                        child: Text('Privacy Policy',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: Color(0xFF8B8E92),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF8B8E92)
                                  // height: 0.10,
                                  ),
                            )),
                      ),
                      const Text(
                        'and',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8B8E92),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Terms & Conditions',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: Color(0xFF8B8E92),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF8B8E92)
                                  // height: 0.10,
                                  ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    ));
  }

  ///Facebook
  onTapBtnFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  ///Google
  onTapBtnGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }
}
