// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snak_bar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/signup_page.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/custome_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInPage extends StatefulWidget {
  LogInPage({super.key});

  // This widget is the root of your application.
  @override
  static String id = "LoginPage";

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // Declare variables for email and password
  String? email;

  String? password;

  // Create a GlobalKey for the Form widget
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Variable to manage loading state
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:
          isLoading, // Set to true if you want to show a loading indicator
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Image(
                  image: AssetImage("assets/images/scholar.png"),
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to the app",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Pacifico",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                const Row(
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFieldPassword(
                  hintText: "Password",
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomeButton(
                  text: "Login",
                  onPressed: () async {
                    try {
                      // Set isLoading to true to show the loading indicator
                      setState(() {
                        isLoading = true;
                      });
                      if (formKey.currentState!.validate()) {
                        await login();
                        // If login is successful, show a snackbar with a success message
                        showsnakbar(context, "Login Successful", Colors.green);
                        // Navigate to the chat page
                        Navigator.pushNamed(context, ChatPage.id, arguments: email);
                      } else {
                        // If email or password is null, show a snackbar with an error message
                        showsnakbar(
                            context, "Please fill in all fields", Colors.red);
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        // If the user is not found, show a snackbar with an error message
                        showsnakbar(context, "No user found for that email.",
                            Colors.red);
                      } else if (e.code == 'invalid-email') {
                        // If the email is invalid, show a snackbar with an error message
                        showsnakbar(
                            context, "Invalid email address.", Colors.red);
                      } else if (e.code == 'wrong-password') {
                        // If the password is wrong, show a snackbar with an error message
                        showsnakbar(
                            context,
                            "Wrong password provided for that user.",
                            Colors.red);
                      } else {
                        // For any other errors, show a snackbar with the error message
                        showsnakbar(context, "Error: ${e.message}", Colors.red);
                      }
                    } finally {
                      // Set isLoading to false to hide the loading indicator
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignupPage.id);
                      },
                      child: const Text(
                        "  Sign Up",
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
