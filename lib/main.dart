import 'package:citytransfers_cabs/screens/loginpage.dart';
import 'package:citytransfers_cabs/screens/registrationpage.dart';
import 'package:flutter/material.dart';
import 'package:citytransfers_cabs/screens/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(
            appId: '1:297855924061:ios:c6de2b69b03a5be8',
            apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
            projectId: 'flutter-firebase-plugins',
            messagingSenderId: '297855924061',
            databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
          )
        : FirebaseOptions(
            appId: '1:297855924061:android:669871c998cc21bd',
            apiKey: '1:545696165670:android:1609f7affbfdf79f419be7',
            messagingSenderId: '297855924061',
            projectId: 'flutter-firebase-plugins',
            databaseURL: 'https://citytransfers-92e25-default-rtdb.firebaseio.com',
          ),
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( 
        fontFamily: 'Brand-Regular',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MainPage.id,  // user gets registration  page first
      routes: {
        RegistrationPage.id: (context) => RegistrationPage(),
        LoginPage.id: (context) => LoginPage(),
        MainPage.id: (context) => MainPage(),
      },
      //theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
