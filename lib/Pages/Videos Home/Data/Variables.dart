import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Classes/Video.dart';

ValueNotifier<int> selectedTab = ValueNotifier(-1);
List<String> buttons = ['Latest', 'Favourites'];

// carousel part
CarouselController carouselController = CarouselController();
ValueNotifier<bool> carouselLoaded = ValueNotifier(false);
ValueNotifier<int> currentCard = ValueNotifier(0);
List<Video> carouselList = [];
