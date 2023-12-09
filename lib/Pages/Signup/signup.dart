import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/Colors.dart';
import '../../Common widgets/button_widget.dart';
import '../../Common widgets/input_text_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameController = TextEditingController();
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
              child: Image.asset("assets/images/New_User.png"),
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
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          SizedBox(height: 150,), //place holder for logo
                          TextFieldInput(
                              textEditingController: _nameController,
                              hintText: "Name",
                              textInputType: TextInputType.text),
                          const SizedBox(height: 25),
                          TextFieldInput(
                              textEditingController: _emailController,
                              hintText: "E-mail",
                              textInputType: TextInputType.emailAddress),
                          const SizedBox(height: 25),
                          TextFieldInput(
                              textEditingController: _passwordController,
                              hintText: "Password",
                              textInputType: TextInputType.text),
                          const SizedBox(height: 25),
                          TextFieldInput(
                              textEditingController: _passwordController,
                              hintText: "Confirm Password",
                              textInputType: TextInputType.text),
                          const SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: CustomButton(
                              buttonColor: primaryColor,
                              onPressed: () {},
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
