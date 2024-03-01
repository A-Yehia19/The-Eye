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
              Text(
                "Welcome back! Glad to see you again.",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "E-mail",
                icon: Icon(Icons.email_rounded),
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Password",
                icon: Icon(Icons.lock_rounded), // Changed icon to lock icon
                textInputType: TextInputType.text,
                isPass: true, // Mark this as a password field
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    // Implement forgot password functionality
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              CustomButton(
                buttonColor: secondaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profiles()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Jua',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: 150, // Adjust the width as needed
                    color: CupertinoColors.white,
                  ),
                  Expanded(
                    child: Text(
                      "or",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Jua',
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 150, // Adjust the width as needed
                    color: CupertinoColors.white,
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                buttonDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                      "assets/images/google_logo.png",
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
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
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style:
                        TextStyle(color: CupertinoColors.white, fontSize: 15),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
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
