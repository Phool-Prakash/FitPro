import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

String selectedOption = '';

class _GoalScreenState extends State<GoalScreen> {
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
            buildOption("Be Healthier"),
            SizedBox(
              height: 10 * heightScale,
            ),
            buildOption("Loose Weight"),
            SizedBox(
              height: 10 * heightScale,
            ),
            buildOption("Build Muscles"),
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
                  onPressed: () {
                    // Next button functionality
                  },
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
