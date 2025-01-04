import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // Progress indicator
        // LinearProgressIndicator(
        //   value: 0.5,
        //   backgroundColor: Colors.grey[300],
        //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        // ),


        Text("Good Morning", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),) ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(title, textAlign: TextAlign.center, style:GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),)),
      ],
    );
  }
}
