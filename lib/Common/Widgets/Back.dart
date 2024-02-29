import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(10),
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        ),

      ),
      color: const Color(0xFF1E232C),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
