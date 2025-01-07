import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleServices{

    // final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<void> getHistory() async {

        // Get collection history from  firestore
        final history = await _firestore.collection('history').get();
        print(history.docs.map((e) => e.data()).toList());
        
    }

    Future<void> uploadData(Map data) async {

        // Get the currentDB from firestore and upload data to it
        final DB = await _firestore.collection('history').get();
        // get currentDB from currentDB
        final currentDB = DB.docs.where((element) => element.data()["closed"] == false).first.data();

        
        if(currentDB["count"] <= 100){

            final addList = DB.docs.where((element) => element.data()["closed"] == false).first.data()["db"] ?? [];

            addList.add(data);

            await _firestore.collection('history').doc('database${currentDB["database"]}').update({
                // Field should be added even if the document does exist
                    "db": addList,
                    "count": currentDB["count"] + 1,
            });

        }
        else{
            await _firestore.collection('history').doc('database${currentDB["database"]}').update({
                "db": data,
                "closed": true
            });

            await _firestore.collection('history').doc('database${currentDB["database"] + 1}').set({
                "db": [],
                "count": 0,
                "database": currentDB["database"] + 1,
                "closed": false
            });
        }
    }

    // Save data Encode Decode and Delete in Shared Preferences
    Future<void> saveListToSharedPreferences(List<Map> data) async {
        // Save data to shared preferences
            final prefs = await SharedPreferences.getInstance();

        final jsonArray = jsonEncode(data);

        await prefs.setString('data', jsonArray);
    }


    Future<Map> getListFromSharedPreferences() async {
        // Get data from shared preferences
            final prefs = await SharedPreferences.getInstance();

        final jsonArray = prefs.getString('data');

        if (jsonArray != null) {
            return jsonDecode(jsonArray);
        } else {
            return {}; // Return an empty list if no data is found
        }
    }


    Future<void> deleteListFromSharedPreferences() async {
        // Delete data from shared preferences
            final prefs = await SharedPreferences.getInstance();

        await prefs.remove('data');
    }
}
