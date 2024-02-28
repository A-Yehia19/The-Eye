import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';

class ChooseFiles extends StatelessWidget {
  const ChooseFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 300,
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: blueEnd,
                    spreadRadius: 2),
              ],
            ),
            child: TextButton(
              onPressed: () {},
              child: Icon(CupertinoIcons.plus, size: 100, color: blueEnd,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Text(
              'Upload video',
              style: TextStyle(
                  color: blueEnd, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
