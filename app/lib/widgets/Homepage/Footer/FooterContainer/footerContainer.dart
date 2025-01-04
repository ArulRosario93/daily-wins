import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterContainer extends StatelessWidget {
  final String title;
  final Function journalClicked;
  const FooterContainer({super.key, required this.title, required this.journalClicked});

  @override
  Widget build(BuildContext context) {

    void onClick(){
      journalClicked();
    }

    return GestureDetector(
      onTap: onClick,
      child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade800)
            ),
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),),
                Icon(Icons.history)
              ],
            ) 
          ),
    );
  }
}