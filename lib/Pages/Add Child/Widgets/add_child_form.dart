// add_child_form.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Widgets/input_text_field.dart';
import 'package:the_eye/Constants/Colors.dart';

enum Gender { male, female }

class AddChildForm extends StatefulWidget {
  const AddChildForm({super.key});

  @override
  AddChildFormState createState() => AddChildFormState();
}

class AddChildFormState extends State<AddChildForm> {
  Gender? selectedGender;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: Text(
            'Add Account',
            style: TextStyle(
              color: primaryColor, // Set the text color to primaryColor
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 24, // Set the text size to 24
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute the free space evenly around the children
          children: [
            Expanded(
              child: RadioListTile<Gender>(
                title: const Text('Male'),
                value: Gender.male,
                groupValue: selectedGender,
                activeColor: highlightColor, // Set the active color to highlightColor
                onChanged: (Gender? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<Gender>(
                title: const Text('Female'),
                value: Gender.female,
                groupValue: selectedGender,
                activeColor: highlightColor, // Set the active color to highlightColor
                onChanged: (Gender? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFieldInput(
              textEditingController: nameController,
              hintText: 'Child\'s Name',
              textInputType: TextInputType.text,
              icon: Icon(Icons.person, color: primaryColor),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFieldInput(
              textEditingController: ageController,
              hintText: 'Age',
              textInputType: TextInputType.number,
              icon: Icon(Icons.cake, color: primaryColor),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFieldInput(
              textEditingController: passwordController,
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              isPass: true,
              icon: Icon(Icons.lock, color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}