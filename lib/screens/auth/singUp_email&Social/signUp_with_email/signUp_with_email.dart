import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/auth/authController.dart';

class SignUpWithEmail1 extends StatefulWidget {
  const SignUpWithEmail1({super.key});

  @override
  State<SignUpWithEmail1> createState() => _SignUpWithEmail1State();
}

class _SignUpWithEmail1State extends State<SignUpWithEmail1> {
  bool _isChecked = false;
  bool obscureText = true;
  late EmailController emailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = Get.put(EmailController());
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
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                            onChanged: emailController.updateEmail,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: const Color(0xFFD1D2D4),
                                fontSize: 13 * heightScale,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            decoration: InputDecoration(
                                hintText: 'Email',
                                label: Text(
                                  'Email',
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF8B8E92),
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0.11,
                                    ),
                                  ),
                                ),
                                hintStyle: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Color(0xFF8B8E92),
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0.09,
                                  ),
                                ),
                                suffixIcon:
                                    Image.asset("assets/icons/email.png"),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Color(0xFF667E9E)),
                                    borderRadius: BorderRadius.circular(8)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Color(0xFF667E9E)),
                                    borderRadius: BorderRadius.circular(8)))),
                      ),
                      SizedBox(
                        height: 24.0 * heightScale,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                            obscureText: obscureText,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: const Color(0xFFD1D2D4),
                                fontSize: 13 * heightScale,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            decoration: InputDecoration(
                                label: Text(
                                  'Password',
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF8B8E92),
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0.11,
                                    ),
                                  ),
                                ),
                                hintText: 'Password',
                                hintStyle: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Color(0xFF8B8E92),
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0.09,
                                  ),
                                ),
                                suffixIconColor: obscureText
                                    ? const Color(0xFF8B8E92)
                                    : const Color(0xFFD1D2D4),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    icon: Icon(
                                      obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Color(0xFF667E9E)),
                                    borderRadius: BorderRadius.circular(8)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Color(0xFF667E9E)),
                                    borderRadius: BorderRadius.circular(8)))),
                      ),
                      SizedBox(
                        height: 5.0 * heightScale,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                                side:
                                    const BorderSide(color: Color(0xFF667E9E)),
                                checkColor: Colors.black,
                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (!states
                                      .contains(MaterialState.selected)) {
                                    return Colors.transparent;
                                  }
                                  return const Color(0xFFA6FF00);
                                }),
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                }),
                            Text('Remember me',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: _isChecked
                                        ? Colors.white
                                        : const Color(0xFF8B8E92),
                                    fontSize: 16 * heightScale,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0.09,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.0 * heightScale,
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
                            Get.to(SecondScreen(),
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
                              height: 0.09 * heightScale,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.0 * heightScale,
                      ),
                      const Text(
                        'or continue with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD1D2D4),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                      SizedBox(
                        height: 48.0 * heightScale,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 20.0* widthScale,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 91.3 * widthScale,
                              height: 44.0 * heightScale,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side:const BorderSide(
                                      width: 1, color: Color(0xFF516580)),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Image.asset("assets/icons/Google.png"),
                            ),
                          ),
                          SizedBox(width: 19.0 * widthScale,),
                          Container(
                            width: 91.3 * widthScale,
                            height: 44.0 * heightScale,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side:const BorderSide(
                                    width: 1, color: Color(0xFF516580)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Image.asset("assets/icons/Apple.png"),
                          ),
                          SizedBox(width: 19.0* widthScale,),
                          Container(
                            width: 91.3 * widthScale,
                            height: 44.0 * heightScale,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side:const BorderSide(
                                    width: 1, color: Color(0xFF516580)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Image.asset("assets/icons/Facebook.png"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100.0 * heightScale,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'By continuing forward, you agree to FitPro’s\n',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: const Color(0xFF8B8E92),
                              fontSize: 14.0 * heightScale,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          children: [
                            const TextSpan(text: "  "),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: const Color(0xFF8B8E92),
                                  fontSize: 14.0 * heightScale,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  height: 0.10,
                                ),
                              ),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {
                              //     _launchURL('https://www.yourprivacypolicyurl.com');
                              //   },
                            ),
                            TextSpan(
                                text: ' and ',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF8B8E92),
                                    fontSize: 14.0 * heightScale,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0.10,
                                  ),
                                )),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: const Color(0xFF8B8E92),
                                  fontSize: 14.0 * heightScale,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  height: 0.10,
                                ),
                              ),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {
                              //     _launchURL('https://www.yourtermsandconditionsurl.com');
                              //   },
                            ),
                            const TextSpan(
                              text: '.',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<EmailController>();
    super.dispose();
  }
}


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailController emailController = Get.find();
    return Scaffold(
      appBar: AppBar(title: Obx((){
        return Text('${emailController.userEmail.value}');
      }),),
    );
  }
}

