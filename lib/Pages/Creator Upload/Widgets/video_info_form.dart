import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart';
import 'package:the_eye/Common/Widgets/input_text_field.dart';

import '../../../Constants/Colors.dart';

class VideoForm extends StatefulWidget {
  const VideoForm({super.key});

  @override
  State<VideoForm> createState() => _VideoFormState();
}

class _VideoFormState extends State<VideoForm> {
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
          child: Container(
            decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Title",
                border: new OutlineInputBorder(borderSide: new BorderSide(color: CupertinoColors.systemGrey)),
                filled: true,
                focusColor: Colors.black87,
                fillColor: CupertinoColors.white,
                contentPadding: const EdgeInsets.all(8),
              ),
              keyboardType: TextInputType.text,
            ),
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
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(20),),
            child: TextField(
              maxLines: 4,
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: "Description",
                border: new OutlineInputBorder(borderSide: new BorderSide(color: CupertinoColors.systemGrey)),
                filled: true,
                focusColor: Colors.black87,
                fillColor: CupertinoColors.white,
                // contentPadding: const EdgeInsets.only(bottom: 80, left: 8),
              ),
              keyboardType: TextInputType.text,
            ),
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
