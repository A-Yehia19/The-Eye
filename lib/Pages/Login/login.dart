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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Image.asset("assets/images/LOGIN.png"),
            ),
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
                    image: DecorationImage(
                      image: AssetImage("assets/images/background2.jpg"),
                      fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    )
                  ),
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
                        const SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: CustomButton(
                            buttonColor: primaryColor,
                            onPressed: () {},
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Jua',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        const Text("-or-",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Jua',
                          ),
                        ),
                        const SizedBox(height: 25,),
                        CustomButton(
                          buttonDecoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: primaryColor, // Set the border color to PrimaryColor
                              width: 6, // Set the border width
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/google_logo.png", height: 20,),
                              const Text(
                                "Continue with Google",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Jua',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),
                        CustomButton(
                          buttonColor: primaryColor,
                          onPressed: () { // temporarily will change function of button
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: const Text(
                            "Create an account",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jua',
                            ),
                          ),
                        ),
                      ],
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
