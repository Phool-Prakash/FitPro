import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({super.key});

  @override
  State<WelcomeScreens> createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  @override
  Widget build(BuildContext context) {
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
                fit: BoxFit.cover,
              ),
              const Positioned(
                top: 360,
                left: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 18.0),
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
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Welcome to FitPro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        height: 0.03,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Where Every Breath Counts – Empowering You to\nBreathe Easy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD1D2D4),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        // height: 0.10,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 35,
                left: 58,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 312,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA6FF00),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Sign Up',
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
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 312,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side:
                                    const BorderSide(color: Color(0xFFA6FF00))),
                            onPressed: () {},
                            child: const Text(
                              'Log In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFA6FF00),
                                fontSize: 16,
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
