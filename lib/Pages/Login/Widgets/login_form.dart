import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Common/Widgets/button_widget.dart';
import '../../../Common/Widgets/input_text_field.dart';
import '../../../Constants/Colors.dart';
import '../../Profiles/profiles.dart';
import '../../Signup/signup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch, // Align children to fill the width
      mainAxisAlignment:
          MainAxisAlignment.center, // Align children vertically centered
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              const Text(
                "Welcome back! Glad to see you again.",
                style: TextStyle(
                  fontSize: 28,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "E-mail",
                icon: const Icon(Icons.email_rounded, color: hintColor,),
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Password",
                icon: const Icon(Icons.lock_rounded, color: hintColor,), // Changed icon to lock icon
                textInputType: TextInputType.text,
                isPass: true, // Mark this as a password field
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    // Implement forgot password functionality
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: hintColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profiles()),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      color: hintColor,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  const Text(
                    "Or Login with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: hintColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: primaryColor,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  // Implement Google sign-in functionality
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/google.png",
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Continue with Google",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Jua',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style:
                        TextStyle(color: textColor, fontSize: 15),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signup()),
                        );
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
