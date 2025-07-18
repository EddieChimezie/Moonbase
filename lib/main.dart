import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moonbase/features/auth/presentation/pages/login_page.dart';
import 'package:moonbase/firebase_options.dart';
import 'package:moonbase/themes/dark_mode.dart';
import 'package:moonbase/themes/light_mode.dart';

void main() async {
  //FIREBASE SETUP
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
