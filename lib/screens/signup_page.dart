// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snak_bar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});
  static String id = "SignupPage";

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Declare variables for email and password
  String? email;

  String? password;

  // Create a GlobalKey for the Form widget
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Variable to manage loading state
  // This will be used to show a loading indicator while the registration is in progress
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
                      "Sign Up",
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
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: "Email"),
                const SizedBox(height: 20),
                CustomTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: "Password"),
                const SizedBox(height: 20),
                CustomeButton(
                  onPressed: () async {
                    try {
                      // Set isLoading to true to show the loading indicator
                      setState(() {
                        isLoading = true;
                      });

                      // Validate the form fields
                      // If the form is valid, proceed with registration
                      if (formKey.currentState!.validate()) {
                        // Call the register function to create a new user
                        // and await its completion
                        await register();
                        // After successful registration, navigate to the login page
                        showsnakbar(
                            context, "User Created Successfully", Colors.green);
                        // Navigate to the chat page    
                        Navigator.pushNamed(context, ChatPage.id, arguments: email);
                      } else {
                        // If email or password is null, show a snackbar with an error message
                        showsnakbar(
                            context, "Please fill in all fields", Colors.red);
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        // If the password is too weak, show a snackbar with an error message
                        showsnakbar(context,
                            "The password provided is too weak.", Colors.red);
                      } else if (e.code == 'email-already-in-use') {
                        // If the email is already in use, show a snackbar with an error message
                        showsnakbar(
                            context,
                            "The account already exists for that email.",
                            Colors.red);
                      } else {
                        // For any other FirebaseAuthException, show a snackbar with the error message
                        showsnakbar(context, "Error: ${e.message}", Colors.red);
                      }
                    }
                    // Set isLoading to false to hide the loading indicator
                    setState(() {
                      isLoading = false;
                    });
                  },
                  text: "Sign Up",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "  Login",
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

  Future<void> register() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
