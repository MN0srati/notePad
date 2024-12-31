import 'package:flutter/material.dart';

import 'models/database/database_method.dart';
import 'screens/home_screen.dart';


void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}


