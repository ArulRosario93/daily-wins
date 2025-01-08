import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Taskcontainer extends StatelessWidget {

  final String title;
  final Function(String title, int index) taskCompleted;
  final Function(int index) journalClicked;
  final int index;
  const Taskcontainer({super.key, required this.title, required this.taskCompleted, required this.journalClicked, required this.index});

  @override
  Widget build(BuildContext context) {

    void onClick(){
      if (title == "Journel") {
        journalClicked(index);
        return;
      }
      taskCompleted(title, index);
    }

    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade800)
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
    );
  }
}