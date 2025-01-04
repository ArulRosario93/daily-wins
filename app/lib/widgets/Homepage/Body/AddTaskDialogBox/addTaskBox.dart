import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskbox extends StatelessWidget {
  final Function addtoTask;
  const AddTaskbox({super.key, required this.addtoTask});

  @override
  Widget build(BuildContext context) {

    final TextEditingController _controller = TextEditingController();

    void onSubmit(){
      if (_controller.text.isEmpty) {
        return;
      }
      addtoTask(_controller.text);
      Navigator.pop(context);
    }

    return AlertDialog(
      // contentPadding: EdgeInsets.all(12),
      title: Text("Add To Daily Wins", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),),
      content: TextField(
        controller: _controller,
        autofocus: true,
        maxLength: 40,
        decoration: InputDecoration(
          hintText: "Enter Task",
          hintStyle: GoogleFonts.poppins(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: onSubmit,
          child: Text("Add", style: GoogleFonts.poppins(fontSize: 12),),
        )
      ],
    );
  } 
}

class RemoveTask extends StatelessWidget {
  final String title;
  final Function removeTask;
  const RemoveTask({super.key, required this.title, required this.removeTask});

  @override
  Widget build(BuildContext context) {

    final task = title.length > 20 ? "${title.substring(0, 20)}..." : title;

    void remove(){
      removeTask(title);

      // To pop two times
      Navigator.pop(context);
      Navigator.pop(context);
    }

    return AlertDialog(
      title: Text("Are You Sure", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),),
      content: Text("That you want $task to be removed from your Daily Wins?", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.red)
          ),
          onPressed: remove,
          child: Text("Remove", style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),),
        )
      ],
    );
  }
}

class TaskCompleted extends StatelessWidget {
  final String title;
  final Function removeTask;
  const TaskCompleted({super.key, required this.title, required this.removeTask});

  @override
  Widget build(BuildContext context) {

    void onSubmit(){

      // This is where you would add the task to the completed list

      // And Pop the dialog box
      Navigator.pop(context);
    }

    Future toRemove(){
      // This is where you would remove the task from the list
      return showDialog(context: context, builder: (context) => RemoveTask(title: title, removeTask: removeTask));
    }

    final task = title.length > 20 ? "${title.substring(0, 20)}..." : title;

    return Dialog(
      child: Container(
        height: 135,
        width: 200,
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Did you complete $task?", textAlign: TextAlign.left, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red)
                  ),
                  onPressed: toRemove,
                  child: Text("Remove", textAlign: TextAlign.right, style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),),
                ),
                const SizedBox(width: 8,),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green)
                  ),
                  onPressed: onSubmit,
                  child: Text("Yes", textAlign: TextAlign.right, style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class JournalTask extends StatelessWidget {
  const JournalTask({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController _linkController = TextEditingController();

    void onSubmit(){
      if (_linkController.text.isEmpty) {
        return;
      }

      // This is where you would add the task to the completed list

      // And Pop the dialog box
      Navigator.pop(context);
    }

    void copyLink(){
      // This is where you would copy the link to the clipboard
    }

    return AlertDialog(
      title: Text("Enter The Doc Link", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),),
      content: TextField(
        decoration: InputDecoration(
          hintText: "Enter Link",
          hintStyle: GoogleFonts.poppins(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
      actions: [

        // BUTTON CAN BE ACTIVE AND DISABLED
        ElevatedButton(
          
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.grey)
          ),
          onPressed: copyLink, child: Text('Copy Link', style: GoogleFonts.poppins(fontSize: 10, color: Colors.white),)),

        const SizedBox(width: 5,),

        ElevatedButton(
          onPressed: onSubmit,
          child: Text("Enter Link", style: GoogleFonts.poppins(fontSize: 10),),
        )
      ],
    );
  }
}