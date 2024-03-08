import 'package:flutter/material.dart';

ValueNotifier<int> currentPage = ValueNotifier<int>(0);
PageController pageController = PageController();

List <String> onboardingImages = [
  'assets/images/onboarding-1.png',
  'assets/images/onboarding-2.png',
  'assets/images/onboarding-3.png',
];

List <String> onboardingDescriptions = [
  'A rich experience of a safe place for your family to feel the entertainment',
  'A rich experience of a safe place for your family to feel the entertainment',
  'A rich experience of a safe place for your family to feel the entertainment',
];
