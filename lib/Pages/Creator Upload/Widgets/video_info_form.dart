import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Common/Models/Classes/Video.dart';
import '../../../Common/Widgets/button_widget.dart';
import '../../../Common/Widgets/input_text_field.dart';
import '../../../Constants/Colors.dart';
import '../../Video Stream/Video Stream.dart';

class VideoForm extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Title",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFieldInput(
            textEditingController: _titleController,
            hintText: "Title",
            textInputType: TextInputType.text,
            isPass: false,
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Description",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFieldInput(
            textEditingController: _descriptionController,
            hintText: "Description",
            textInputType: TextInputType.text,
            isPass: false,
            maxLines: 4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
          child: CustomButton(
            buttonDecoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
            child: const Text(
              "Upload",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15
                //fontWeight: FontWeight.bold,
                //fontFamily: 'Jua',
              ),
            ),
          ),
        ),
      ],
    );
  }
}