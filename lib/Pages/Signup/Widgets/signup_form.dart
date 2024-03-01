import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Profile%20Class.dart';

import '../../../Common/Widgets/button_widget.dart';
import '../../../Common/Widgets/input_text_field.dart';
import '../../../Constants/Colors.dart';
import '../../Login/login.dart';
import '../../Profiles/profiles.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: "Hello! Glad to serve you. Welcome to ",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "The Eye!",
                  style: TextStyle(
                    color: primaryColor, // Change the color of "The Eye"
                    fontWeight: FontWeight.bold, // Change the font weight of "The Eye"
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          TextFieldInput(
              textEditingController: _nameController,
              hintText: "Enter your name",
              icon: Icon(Icons.person),
              textInputType: TextInputType.text
          ),
          const SizedBox(height: 25),
          TextFieldInput(
              textEditingController: _emailController,
              hintText: "Enter your email",
              icon: Icon(Icons.email),
              textInputType: TextInputType.emailAddress
          ),
          const SizedBox(height: 25),
          TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Password",
              icon: Icon(Icons.lock),
              textInputType: TextInputType.text
          ),
          const SizedBox(height: 25),
          TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Confirm Password",
              icon: Icon(Icons.lock),
              textInputType: TextInputType.text
          ),
          const SizedBox(height: 25,),
          CustomButton(
            buttonColor: secondaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profiles()),
              );
            },
            child: const Text("Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Jua',
              ),
            ),
          ),
          const SizedBox(height: 25,),
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
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style:
                TextStyle(color: CupertinoColors.white, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
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
    );
  }
}
