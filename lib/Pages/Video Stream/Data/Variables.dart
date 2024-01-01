import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Video%20Class.dart';

final videoNotifier = ValueNotifier<bool>(false);

List<Video> recommendedList = [
  Video('1', 'Captions 1', 'https://i.etsystatic.com/16969773/r/il/a96656/3913504422/il_794xN.3913504422_mpmx.jpg', 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
  Video('2', 'Captions 2', 'https://th.bing.com/th/id/OIP.D89XV9OcVO3DwpsZ56msIAHaHa?rs=1&pid=ImgDetMain', 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
  Video('3', 'Captions 3', 'https://th.bing.com/th/id/OIP._wSUkMiSCzx-uJQd84hSpQAAAA?w=474&h=474&rs=1&pid=ImgDetMain', 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
  Video('4', 'Captions 4', 'https://i.pinimg.com/originals/cf/1b/03/cf1b03dceffaa881eccc34ada7bba724.jpg', 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
  Video('5', 'Captions 5', 'https://i.pinimg.com/originals/dd/e2/85/dde285a4f2fe661421bf352ea2cc5ebe.jpg', 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
];