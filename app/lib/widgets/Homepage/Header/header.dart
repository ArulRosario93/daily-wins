import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String title;
  final String header;
  const Header({super.key, required this.title, required this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text(header, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),) ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(title, textAlign: TextAlign.center, style:GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),)),
      
      ],
    );
  }
}
