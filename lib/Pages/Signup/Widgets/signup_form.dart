import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                fontSize: 24.sp,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
              children: const [
                TextSpan(
                  text: "The Eye!",
                  style: TextStyle(
                    color: highlightColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          TextFieldInput(
              textEditingController: _nameController,
              hintText: "Enter your name",
              icon: const Icon(Icons.person, color: hintColor,),
              textInputType: TextInputType.text
          ),
          const SizedBox(height: 25),
          TextFieldInput(
              textEditingController: _emailController,
              hintText: "Enter your email",
              icon: const Icon(Icons.email, color: hintColor,),
              textInputType: TextInputType.emailAddress
          ),
          const SizedBox(height: 25),
          TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Password",
              icon: const Icon(Icons.lock, color: hintColor,),
              textInputType: TextInputType.text
          ),
          const SizedBox(height: 25),
          TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Confirm Password",
              icon: const Icon(Icons.lock, color: hintColor,),
              textInputType: TextInputType.text
          ),
          const SizedBox(height: 25,),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profiles()),
              );
            },
            child: const Text("Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 25,),
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
                "Or Register with",
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
          const SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account? ",
                style:
                TextStyle(color: textColor, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
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
    );
  }
}
