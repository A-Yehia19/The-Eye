import 'dart:html';

import 'package:flutter/cupertino.dart';

List<File> files = [];
ValueNotifier<bool> filesChosen = ValueNotifier(false);
List<Widget> chosenFilesNames = [];
