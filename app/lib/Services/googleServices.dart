import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class GoogleServices{

    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<User?> signInWithGoogle() async {
      try {
        // Trigger Google sign-in flow for web
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();

        final UserCredential userCredential =
            await _auth.signInWithPopup(googleProvider);

        return userCredential.user;

      } catch (e) {
        print("Error during Google Sign-In: $e");
        return null;
      }
    }

    Future<String> getAccessToken() async {
      try {
        String? idToken = await _auth.currentUser?.getIdToken();
        return idToken!;
      } catch (error) {
        print(error);
        return "null";
      }
    }

    Future<void> createSheet() async {
      // Replace with your actual credentials
      String jsonString = await getAccessToken();

      print('Access Token: $jsonString');

      var headers = {
          'Authorization': 'Bearer $jsonString',
          'Content-Type': 'application/json',
      };

      var body = jsonEncode({
          'title': 'My New Sheet', 
      });

      var url = Uri.parse('https://docs.googleapis.com/v1/documents');

      try {
        var response = await http.post(url, headers: headers, body: body);
        if (response.statusCode == 200) {
          print('Sheet created successfully!');
          print(jsonDecode(response.body)); 
        } else {
          print('Failed to create sheet. Status code: ${response.statusCode}');
          print(response.body);
        }
      } catch (e) {
        print('Error creating sheet: $e');
      }
    }

}