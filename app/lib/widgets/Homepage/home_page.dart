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
    {
      "title": "Good Morning",
      "subtitle": "Rise with determination; today’s possibilities are limitless. Start strong, and success will follow!",
    },
    {
      "title": "Good Morning",
      "subtitle": "The day is yours to conquer. Stay focused, and success will follow!",
    },
    
  ];

  List afternoon = [
    {
      "title": "Good Afternoon",
      "subtitle": "Stay focused and keep pushing! The day’s progress is built by steady steps.",
    },
    {
      "title": "Good Afternoon",
      "subtitle": "Pause, refresh, and fuel your energy. There’s still time to turn the day around!",
    }
  ];

  List evening = [
    {
      "title": "Good Evening",
      "subtitle": "Reflect on the day’s wins and losses. Tomorrow is a new day to conquer!",
    },
    {
      "title": "Good Evening",
      "subtitle": "The day is done, but your journey is not. Rest, recharge, and get ready to rise again!",
    }
  ];

  String getGreeting(String head) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return morning[Random().nextInt(morning.length)][head];
    } else if (hour < 17) {
      return afternoon[Random().nextInt(afternoon.length)][head];
    } else {
      return evening[Random().nextInt(evening.length)][head];
    }
  }

  @override
  void initState() {
    super.initState();

    // GoogleServices().signInWithGoogle();
  }

  void onPressed() {
    GoogleServices().getHistory();
  }

  void addtoTask(String title) async {

    setState(() {
      tasks.add({"title": title});
    });

    await GoogleServices().saveListToSharedPreferences({
        "title": title,
    });

    GoogleServices().uploadData(await GoogleServices().getListFromSharedPreferences());

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
            Flexible(flex: 2, child: Header(title: getGreeting("subtitle"), header: getGreeting("title"),)),
        
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