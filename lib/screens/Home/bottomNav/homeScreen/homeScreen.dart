import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF181E26),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 222,
                      height: 40,
                      child: SearchBar(
                        hintText: 'Search workouts',
                        hintStyle: MaterialStatePropertyAll<TextStyle>(
                            GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Color(0xFF8B8E92),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                        backgroundColor:
                        const MaterialStatePropertyAll<Color>(
                            Color(0xFF202731)),
                        leading: Image.asset("assets/icons/search.png"),
                      )),
                  Container(
                    width: 86,
                    height: 40,
                    padding: const EdgeInsets.only(
                        top: 8, left: 16, right: 8, bottom: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFA6FF00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Beast',
                          style: TextStyle(
                            color: Color(0xFF181E26),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.30,
                          ),
                        ),
                        Image.asset('assets/icons/downArrow.png')
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}




// SearchAnchor(
//   builder: (BuildContext context, SearchController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: SizedBox(
//           width: 220,
//           height: 40,
//           child: SearchBar(
//             backgroundColor: const MaterialStatePropertyAll<Color>(
//                 Color(0xFF202731)),
//             controller: controller,
//             padding: const MaterialStatePropertyAll<EdgeInsets>(
//                 EdgeInsets.symmetric(horizontal: 16.0)),
//             onTap: () {
//               controller.openView();
//             },
//             onChanged: (_) {
//               controller.openView();
//             },
//             leading: Image.asset("assets/icons/search.png"),
//           )),
//     );
//   },
//   suggestionsBuilder:
//       (BuildContext context, SearchController controller) {
//     return List<ListTile>.generate(5, (int index) {
//       final String item = 'item $index';
//       return ListTile(
//         title: Text(item),
//         onTap: () {
//           setState(() {
//             controller.closeView(item);
//           });
//         },
//       );
//     });