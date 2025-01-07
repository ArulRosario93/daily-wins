import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  bool isDarkMode = false;

  void handleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Streak", style: GoogleFonts.poppins(fontSize: 15),),
                const SizedBox(width: 20,),
                Text("0", style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),)
              ]
            ),

            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dark Mode", style: GoogleFonts.poppins(fontSize: 15),),
                
                const SizedBox(width: 20,),

                Switch(
                  value: isDarkMode, 
                  onChanged: handleDarkMode
                )
              ]
            ),

        ],
      )
    );
  }
}