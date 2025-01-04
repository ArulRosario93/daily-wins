import 'package:app/widgets/Homepage/Footer/FooterContainer/footerContainer.dart';
import 'package:app/widgets/Setting/Setting.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/History/history.dart';

class Footer extends StatelessWidget {
  final GestureTapCallback addTask;
  const Footer({super.key, required this.addTask});

  @override
  Widget build(BuildContext context) {

    void handleHistory(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => History()));
    }

    void handleSetting(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FooterContainer(title: 'Add Task', journalClicked: addTask),

        FooterContainer(title: 'History', journalClicked: handleHistory),
        
        FooterContainer(title: 'Setting', journalClicked: handleSetting),
      ],
    );
  }
}