import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Widgets/Custom%20Radio.dart';
import 'package:the_eye/Pages/Signup/Data/Functions/signup.dart';

import '../../../Common/Firebase/Auth/signin google.dart';
import '../../../Common/Widgets/button_widget.dart';
import '../../../Common/Widgets/input_text_field.dart';
import '../../../Constants/Colors.dart';
import '../../Login/login.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  bool isParent = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
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
                  textEditingController: _passwordConfirmController,
                  hintText: "Confirm Password",
                  icon: const Icon(Icons.lock, color: hintColor,),
                  textInputType: TextInputType.text
              ),
              const SizedBox(height: 25,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign up as:",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRadio(
                    value: true,
                    groupValue: isParent,
                    onChanged: (value) {
                      setState(() {
                        isParent = value;
                      });
                    },
                  ),
                  const Text("Parent",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 40.w,),
                  CustomRadio(
                    value: false,
                    groupValue: isParent,
                    onChanged: (value) {
                      setState(() {
                        isParent = value;
                      });
                    },
                  ),
                  const Text("Creator",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              CustomButton(
                onPressed: () => signup(
                    _nameController.text,
                    _emailController.text,
                    _passwordController.text,
                    _passwordConfirmController.text,
                    isParent,
                    context
                ),
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
                onPressed: () => googleSignUp(context),
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
              SizedBox(height: 35.h,),
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
                        "Login Now",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
