import 'package:flutter/material.dart';

import '../../../Common/Models/Video Class.dart';

ValueNotifier<int> selectedIdx = ValueNotifier(0);
List<String> buttons = ['Favourites', 'New'];

List<Video> videosList = [
  Video('1', 'Star vs the force of evil', 'https://th.bing.com/th/id/OIP.NGqU_DtxJjfgCxmSgirA0QHaEK?rs=1&pid=ImgDetMain', 'https://youtu.be/8hJ5ecrpp8k?si=mX0osoAByNncHi0G'),
  Video('2', 'Ludo return', 'https://th.bing.com/th/id/OIP.ASuVSxGACh6kVozAoKLZWAHaEK?rs=1&pid=ImgDetMain', 'https://youtu.be/lTgyEHDIKbw?si=8zp60OntsR2o-YTS'),
  Video('3', 'IS THIS REAALLLY HAPPENED!!', 'https://th.bing.com/th/id/OIP.DlNz3vhaHhmyyM6BtrI2VAHaEK?rs=1&pid=ImgDetMain', 'https://youtu.be/GBIIQ0kP15E?si=LyuQ0_mjTQBBYCzL'),
  Video('4', 'Adventure time distant lands', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0', 'https://youtu.be/cvDxko2Zm0Q?si=8Wmjf2H5tlUbDMKQ'),
  Video('5', 'Adventure time: the great war', 'https://th.bing.com/th/id/R.041b2683aea0e8265520ccbce371efde?rik=OqGwneFlsmLuSA&riu=http%3a%2f%2fwww.animationmagazine.net%2fwordpress%2fwp-content%2fuploads%2fAdventure-Time-Finale-post.jpg&ehk=j9Idar64E06LnA2iXr8Uz4GKkKQEyoKfzDQjxCHUpA0%3d&risl=&pid=ImgRaw&r=0', 'https://youtu.be/YPH-KTMCdXc?si=G8eCLmWT_oT4ba2w'),
  Video('6', 'Marceline’s daily routine', 'https://th.bing.com/th/id/R.43dc2f053ff386173ba914fb7870bf3d?rik=mjNqm%2bf7n4JMxg&pid=ImgRaw&r=0', 'https://youtu.be/h28xpNvW9Yw?si=E0Nik5OKWHSRZd3D'),
];

const profileImagePlaceholder = 'assets/images/profile_placeholder.png';
String username = 'User';
String userImage = profileImagePlaceholder;