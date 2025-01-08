import 'package:app/Services/googleServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/widgets/Homepage/home_page.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 60 * 24 = 1440 minutes in a day
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(
    fileName: ".env",
  );
  Workmanager().initialize(
    callbackDispatcher, // The top-level function that runs your tasks
    isInDebugMode: true, // Set to false in production
  );
  Workmanager().registerPeriodicTask(
    "midnightTask", // Unique name for the task
    "checkMidnightTask", // Name of the background task
    frequency: Duration(minutes: 15), // Runs once every 24 hours
    initialDelay: Duration(seconds: 10), // Initial delay before first execution
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == "checkMidnightTask") {
        performMidnightTask();
    }
    return Future.value(true); // Signal task completion
  });
}

void performMidnightTask() async {
  // Perform your task here, e.g., send a notification or update data
  
  await GoogleServices().uploadData(
    [
      {
        "title": "Midnight Task",
        "completed": true,
      }
    ],
  );
  GoogleServices().deleteListFromSharedPreferences();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
