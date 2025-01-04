import 'package:app/widgets/Homepage/Body/TaskContainer/taskContainer.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List tasks;
  final Function(String) taskCompleted;
  final Function journalClicked;
  const Body({super.key, required this.tasks, required this.taskCompleted, required this.journalClicked});

  @override
  Widget build(BuildContext context) {

    double page = tasks.length / 3; // 2
    double count = tasks.length / 2; // 3

    int counter = 0;
    int endAt = tasks.length;

    return page > 2? PageView(

      children: [

        for (var i = 0; i < page.floor(); i++)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

                Flexible(
                  flex: 1, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var i = 0; counter < endAt && i < 3 ;counter++, i++) 
                        Taskcontainer(title: tasks[counter]["title"], taskCompleted: taskCompleted, journalClicked: journalClicked)             
                    ],
                  ),
                ),
                Flexible(
                  flex: 1, 
                  child: Row(
                    children: [
                      for (var i = 0; counter < endAt && i < 3 ;counter++, i++)  
                        Taskcontainer(title: tasks[counter]["title"], taskCompleted: taskCompleted, journalClicked: journalClicked)             
                      ],
                  ),
                ),
            ]
          ),
      ],
    ) : 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

          Flexible( flex: 1, child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < count.floor(); i++) 
                    Taskcontainer(title: tasks[i]["title"], taskCompleted: taskCompleted, journalClicked: journalClicked)             
              ],
            ),
          ),

          Flexible( flex: 1, child: 
            Row(
              children: [
                for (var i = count.floor(); i < tasks.length; i++)  
                  Taskcontainer(title: tasks[i]["title"], taskCompleted: taskCompleted, journalClicked: journalClicked)
                ],
            ),
          ),
      ],
    );
  }
}