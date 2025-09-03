import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LogInPage.id: (context) => LogInPage(),
        SignupPage.id : (context) => SignupPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: LogInPage.id,
    );
  }
}
