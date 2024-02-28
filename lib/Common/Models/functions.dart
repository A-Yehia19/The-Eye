// import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:the_eye/Common/Models/variables.dart';
//
// chooseFiles(context) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
//
//   if (result != null) {
//     chosenFilesNames.clear();
//     files = result.paths.map((path) => File(path!)).toList();
//     for (var file in files) {
//       final name = file.toString().split('/').last.replaceAll("'", "");
//       chosenFilesNames.add(
//           Text(
//             name,
//             style: const TextStyle(
//               fontSize: 20,
//               color: Colors.white,
//             ),
//           )
//       );
//     }
//     filesChosen.value = true;
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('No files chosen'),
//           duration: Duration(seconds: 2),
//         )
//     );
//   }
// }