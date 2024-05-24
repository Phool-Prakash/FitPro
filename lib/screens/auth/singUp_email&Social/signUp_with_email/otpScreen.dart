import 'package:fit_pro/screens/auth/singUp_email&Social/signUp_with_email/signUp_with_email.dart';
import 'package:fit_pro/screens/finishScreen/finish_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/auth/authController.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isResendActive = false;
  int _resendTime = 30;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
    _otpController.addListener(_checkOtpLength);
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_resendTime > 0) {
        setState(() {
          _resendTime--;
        });
        _startTimer();
      } else {
        setState(() {
          _isResendActive = true;
        });
      }
    });
  }

  void _checkOtpLength() {
    setState(() {
      _isButtonEnabled = _otpController.text.length == 8;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _otpController.dispose();
    super.dispose();
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

    double scaledTextSize = 16.0 * widthScale;
    double scaledButtonHeight = 50.0 * heightScale;
    double scaledButtonWidth = 200.0 * widthScale;

    double topPosition = screenHeight * 0.41; // 41% from the top
    double leftPosition = screenWidth * 0.15; // 10% from the left
    double bottomPosition = screenHeight * 0.10; // 59% from the bottom

    final EmailController emailController = Get.find();
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              "assets/images/Bgimg.svg"),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70.0 * heightScale,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Enter the 8-digit code sent\nto your email.',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0 * heightScale,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          // height: 0.06,
                          letterSpacing: -0.72,
                        ),
                      )),
                ),
                SizedBox(
                  height: 25 * heightScale,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(
                          emailController.userEmail.value,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: const Color(0xFFD1D2D4),
                              fontSize: 14 * heightScale,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              height: 0.10,
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        width: 8 * widthScale,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text('Edit',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: const Color(0xFFD1D2D4),
                                fontSize: 14 * heightScale,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                height: 0.10,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 48 * heightScale,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: const Color(0xFFD1D2D4),
                        fontSize: 16 * heightScale,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: '8-digit code',
                      labelStyle: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: const Color(0xFF8B8E92),
                          fontSize: 16 * heightScale,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFF667E9E)),
                          borderRadius: BorderRadius.circular(8)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFF667E9E)),
                          borderRadius: BorderRadius.circular(8)),
                      suffixIcon: IconButton(
                        icon: Image.asset(
                          "assets/icons/Refresh.png",
                          color: _isResendActive
                              ? const Color(0xFFD1D2D4)
                              : const Color(0xFF8B8E92),
                        ),
                        onPressed: _isResendActive
                            ? () {
                                setState(() {
                                  _resendTime = 30;
                                  _isResendActive = false;
                                  _startTimer();
                                });
                              }
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8 * heightScale),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _isResendActive
                          ? 'Resend code'
                          : 'Resend code in $_resendTime s',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: _isResendActive
                              ? const Color(0xFFD1D2D4)
                              : const Color(0xFF8B8E92),
                          fontSize: 12 * heightScale,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.11,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 48 * heightScale),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48 * heightScale,
                    child: ElevatedButton(
                      onPressed: _isButtonEnabled ? () {
                        Get.to(FinishScreen());
                      } : () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: _isButtonEnabled
                            ? const Color(0xFFA6FF00)
                            : const Color.fromRGBO(166, 255, 0, 0.59),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                      ),
                      child: Text('Continue',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF464B51),
                              fontSize: 16 * heightScale,
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
          )
        ],
      ),
    ));
  }
}
