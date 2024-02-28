import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Creator%20Home/creator_home.dart';
import 'package:the_eye/Pages/Login/login.dart';
import 'package:the_eye/Pages/Profiles/profiles.dart';
import 'package:the_eye/Pages/Signup/signup.dart';
import 'package:the_eye/Pages/Videos%20Home/Videos%20Home.dart';

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
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'The Eye',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: 'Poppins',
          useMaterial3: true,
          textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: textColor,
            displayColor: textColor,
          ),
        ),
        routes: {
          '/login': (context) => const Login(),
          '/signup': (context) => const Signup(),
          '/profiles': (context) => const Profiles(),
          '/videoHome': (context) => const VideosHome(),
        },
        home: child,
      ),
      child: const CreatorHome(),
    );
  }
}
