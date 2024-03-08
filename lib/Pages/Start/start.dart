import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Start/Widgets/start_background.dart';

import 'Widgets/start_buttons.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StartBackground(),
            Expanded(child: SizedBox()),
            StartButtons(),
          ],
        ),
      ),
    );
  }
}
