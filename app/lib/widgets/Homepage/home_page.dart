import 'dart:math';

import 'package:app/Services/googleServices.dart';
import 'package:app/widgets/Homepage/Body/AddTaskDialogBox/addTaskBox.dart';
import 'package:app/widgets/Homepage/Body/body.dart';
import 'package:app/widgets/Homepage/Footer/footer.dart';
import 'package:app/widgets/Homepage/Header/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map> tasks = [
    {
      "title": "Bible Study",
    },
    {
      "title": "Physical Win",
    },
    {
      "title": "Journel",
    },
  ];

  List morning = [
    "Rise with determination; today’s possibilities are limitless. Start strong, and success will follow!",
    "A new dawn brings new opportunities—go seize them and make today extraordinary!",
    "Be the energy you want to attract. Shine bright and take on the day!",
  ];

  List afternoon = [
    "Stay focused and keep pushing! The day’s progress is built by steady steps.",
    "Pause, refresh, and fuel your energy. There’s still time to turn the day around!",
  ];

  List evening = [
    "Reflect on the day’s wins and losses. Tomorrow is a new day to conquer!",
    "The day is done, but your journey is not. Rest, recharge, and get ready to rise again!",
  ];

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return morning[Random().nextInt(morning.length)];
    } else if (hour < 17) {
      return afternoon[Random().nextInt(afternoon.length)];
    } else {
      return evening[Random().nextInt(evening.length)];
    }
  }

  @override
  void initState() {
    super.initState();

    // GoogleServices().signInWithGoogle();
  }

  void onPressed() {
    GoogleServices().createSheet();
  }

  void addtoTask(String title) {
    setState(() {
      tasks.add({"title": title});
    });
  }

  void removeTask(String title){
    setState(() {
      tasks.removeWhere((element) => element["title"] == title);
    });
  }

  Future clickOnJurnal() {
    return showDialog(context: context, builder: (context) => JournalTask());
  }

  Future addTask() {
    return showDialog(context: context, builder: (context) => AddTaskbox(addtoTask: addtoTask));
  }

  Future taskCompleted(String title){
    return showDialog(context: context, builder: (context) => TaskCompleted(title: title, removeTask: removeTask));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
        
            //Header
            Flexible(flex: 2, child: Header(title: getGreeting(),)),
        
            //Body
            Flexible(flex: 5, child: Body(tasks: tasks, taskCompleted: taskCompleted, journalClicked: clickOnJurnal)),
        
            // Footer
            Flexible(flex: 2, child: Footer(addTask: addTask)),

          ],
        ),
      )
    );
  }
}