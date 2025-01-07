import 'package:app/Services/googleServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/widgets/Homepage/home_page.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(
    fileName: ".env",
  );
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    callbackDispatcher, // The top-level function that runs your tasks
    isInDebugMode: true, // Set to false in production
  );
  Workmanager().registerPeriodicTask(
    "midnightTask", // Unique name for the task
    "checkMidnightTask", // Name of the background task
    frequency: Duration(hours: 24), // Runs once every 24 hours
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
      final now = DateTime.now();
      if (now.hour == 0 && now.minute == 0) {
        performMidnightTask();
      }
    }
    return Future.value(true); // Signal task completion
  });
}

void performMidnightTask() async {
  // Perform your task here, e.g., send a notification or update data
  
  await GoogleServices().uploadData(await GoogleServices().getListFromSharedPreferences());

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
