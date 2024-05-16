import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              "assets/images/Bgimg.svg"),
          Positioned(
              top: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'FitPro',
                        style: TextStyle(
                        color: Color(0xFFA6FF00),
                        fontSize: 40,
                        fontFamily: 'Orbitron',
                        fontWeight: FontWeight.w900,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  InkWell(
                    onTap: () {
                      onTapBtnGoogle();
                    },
                    child: Container(
                      width: 312,
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFF516580),
                              ),
                              borderRadius: BorderRadius.circular(100))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Google.png"),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text(
                            'Continue with Google',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 0.09,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      onTapBtnFacebook();
                    },
                    child: Container(
                      width: 312,
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFF516580),
                              ),
                              borderRadius: BorderRadius.circular(100))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Facebook.png"),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text(
                            'Continue with Facebook',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 0.09,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 312,
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFF516580),
                              ),
                              borderRadius: BorderRadius.circular(100))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Apple.png"),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text(
                            'Continue with Apple',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 0.09,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 1,
                        color: const Color.fromRGBO(43, 54, 69, 1),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'OR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD1D2D4),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 200,
                        height: 1,
                        color: const Color.fromRGBO(43, 54, 69, 1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: 312,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: const Color(0xFFA6FF00),
                      ),
                      onPressed: () {
                        Get.to(const SignUpWithEmail(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      child: const Text(
                        'Continue with Email',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF181E26),
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Positioned(
            bottom: 8,
            left: 75,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'By continuing forward, you agree to FitPro’s',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8B8E92),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.20,
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            disabledBackgroundColor: Colors.transparent),
                        onPressed: () {},
                        child: const Text(
                          'Privacy Policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF8B8E92),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF8B8E92)
                              // height: 0.10,
                              ),
                        ),
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
                        child: const Text(
                          'Terms & Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF8B8E92),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF8B8E92)
                              // height: 0.10,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
