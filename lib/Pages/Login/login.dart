import 'package:flutter/material.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart';
import 'package:the_eye/Common/Widgets/input_text_field.dart';
import 'package:the_eye/Constants/Colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background1.jpg"),
                    fit: BoxFit.fill)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/eye_white.png",
                  height: 100,
                  fit: BoxFit.fitHeight,
                ),
                const Text(
                  "The Eye",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ),
          Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient:
                            LinearGradient(
                              begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: gradientColors),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            TextFieldInput(
                                textEditingController: _emailController,
                                hintText: "E-mail",
                                textInputType: TextInputType.emailAddress
                            ),
                            const SizedBox(height: 25),
                            TextFieldInput(
                                textEditingController: _passwordController,
                                hintText: "Password",
                                textInputType: TextInputType.text
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: CustomButton(
                                buttonColor: primaryColor,
                                onPressed: () {
                                  // Navigate to the Profiles page when the button is pressed
                                  Navigator.pushNamed(context, '/profiles');
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Jua',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "-or-",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Jua',
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomButton(
                              buttonDecoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:
                                      primaryColor, // Set the border color to PrimaryColor
                                  width: 6, // Set the border width
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/images/google_logo.png",
                                    height: 36,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  const Text(
                                    "Continue with Google",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Jua',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomButton(
                              buttonColor: primaryColor,
                              onPressed: () {
                                // temporarily will change function of button
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: const Text(
                                "Create an account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Jua',
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
