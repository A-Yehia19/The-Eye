import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../../Common/Models/Classes/Creator.dart';
import '../../../Common/Models/Classes/Video.dart';

ValueNotifier<int> selectedTab = ValueNotifier(-1);
List<String> buttons = ['Latest', 'Favourites'];

List<Video> videosList = [
  Video(id: '1', caption: 'Star vs the force of evil season 2 is announced and its rolling as helll',
    thumbnail: 'https://th.bing.com/th/id/OIP.NGqU_DtxJjfgCxmSgirA0QHaEK?rs=1&pid=ImgDetMain',
    url: 'https://youtu.be/8hJ5ecrpp8k?si=mX0osoAByNncHi0G',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
  Video(id: '2', caption: 'Ludo return',
    thumbnail: 'https://th.bing.com/th/id/OIP.ASuVSxGACh6kVozAoKLZWAHaEK?rs=1&pid=ImgDetMain',
    url: 'https://youtu.be/lTgyEHDIKbw?si=8zp60OntsR2o-YTS',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
  Video(id: '3', caption: 'IS THIS REAALLLY HAPPENED!!',
    thumbnail: 'https://th.bing.com/th/id/OIP.DlNz3vhaHhmyyM6BtrI2VAHaEK?rs=1&pid=ImgDetMain',
    url: 'https://youtu.be/GBIIQ0kP15E?si=LyuQ0_mjTQBBYCzL',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
  Video(id: '4', caption: 'Adventure time distant lands',
    thumbnail: 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0',
    url: 'https://youtu.be/cvDxko2Zm0Q?si=8Wmjf2H5tlUbDMKQ',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
  Video(id: '5', caption: 'Adventure time: the great war',
    thumbnail: 'https://th.bing.com/th/id/R.041b2683aea0e8265520ccbce371efde?rik=OqGwneFlsmLuSA&riu=http%3a%2f%2fwww.animationmagazine.net%2fwordpress%2fwp-content%2fuploads%2fAdventure-Time-Finale-post.jpg&ehk=j9Idar64E06LnA2iXr8Uz4GKkKQEyoKfzDQjxCHUpA0%3d&risl=&pid=ImgRaw&r=0',
    url: 'https://youtu.be/YPH-KTMCdXc?si=G8eCLmWT_oT4ba2w',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
];

const profileImagePlaceholder = 'assets/images/profile_placeholder.png';
String username = 'User';
String userImage = profileImagePlaceholder;



CarouselController carouselController = CarouselController();
ValueNotifier<int> currentCard = ValueNotifier(0);

List<Video> carouselList = [
  Video(id: '1', caption: 'Star vs the force of evil season 2 is announced and its rolling as helll',
    thumbnail: 'https://th.bing.com/th/id/OIP.NGqU_DtxJjfgCxmSgirA0QHaEK?rs=1&pid=ImgDetMain',
    url: 'https://youtu.be/8hJ5ecrpp8k?si=mX0osoAByNncHi0G',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
  Video(id: '2', caption: 'Ludo return',
    thumbnail: 'https://th.bing.com/th/id/OIP.ASuVSxGACh6kVozAoKLZWAHaEK?rs=1&pid=ImgDetMain',
    url: 'https://youtu.be/lTgyEHDIKbw?si=8zp60OntsR2o-YTS',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
  Video(id: '3', caption: 'IS THIS REAALLLY HAPPENED!!',
    thumbnail: 'https://th.bing.com/th/id/OIP.DlNz3vhaHhmyyM6BtrI2VAHaEK?rs=1&pid=ImgDetMain',
    url: 'https://youtu.be/GBIIQ0kP15E?si=LyuQ0_mjTQBBYCzL',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
  Video(id: '4', caption: 'Adventure time distant lands',
    thumbnail: 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0',
    url: 'https://youtu.be/cvDxko2Zm0Q?si=8Wmjf2H5tlUbDMKQ',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
  Video(id: '5', caption: 'Adventure time: the great war',
    thumbnail: 'https://th.bing.com/th/id/R.041b2683aea0e8265520ccbce371efde?rik=OqGwneFlsmLuSA&riu=http%3a%2f%2fwww.animationmagazine.net%2fwordpress%2fwp-content%2fuploads%2fAdventure-Time-Finale-post.jpg&ehk=j9Idar64E06LnA2iXr8Uz4GKkKQEyoKfzDQjxCHUpA0%3d&risl=&pid=ImgRaw&r=0',
    url: 'https://youtu.be/YPH-KTMCdXc?si=G8eCLmWT_oT4ba2w',
    creator: Creator('Marceline', 'https://th.bing.com/th/id/R.5cdbf7c8dbf68d6c728938101948070a?rik=C62n0kIc8hHQlQ&pid=ImgRaw&r=0'),
  ),
];