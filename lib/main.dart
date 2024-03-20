import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Login/login.dart';
import 'package:the_eye/Pages/OnBoarding/OnBoarding.dart';
import 'package:the_eye/Pages/Payment/payment.dart';
import 'package:the_eye/Pages/Profiles/profiles.dart';
import 'package:the_eye/Pages/Signup/signup.dart';
import 'package:the_eye/Pages/Videos%20Home/Videos%20Home.dart';

import 'Common/Models/Classes/Creator.dart';
import 'Common/Themes/Input Decoration.dart';
import 'Common/Widgets/SnackBar.dart';
import 'Pages/Creator Home/creator_home.dart';
import 'Pages/Start/start.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Creator creator = Creator(
        id: '1',
        name: 'John Doe',
        gender: 'male',
        imageURL: 'assets/images/daddy.jpg',
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'The Eye',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: Bar.messengerKey,
        theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: 'Poppins',
          useMaterial3: true,
          textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: textColor,
            displayColor: textColor,
          ),
          inputDecorationTheme: inputDecorationThemeTheme,
          scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          '/started': (context) => const Start(),
          '/onBoarding': (context) => const OnBoarding(),
          '/login': (context) => const Login(),
          '/signup': (context) => const Signup(),
          '/profiles': (context) => const Profiles(),
          '/videoHome': (context) => const VideosHome(),
          '/payment': (context) => const Payment(),
        },

        home: CreatorHome(creator: creator),
      ),
      child: FirebaseAuth.instance.currentUser == null
          ? const OnBoarding()
          : const Profiles(),
    );
  }
}
