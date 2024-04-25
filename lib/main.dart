import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Login/login.dart';
import 'package:the_eye/Pages/OnBoarding/OnBoarding.dart';
import 'package:the_eye/Pages/Profiles/profiles.dart';
import 'package:the_eye/Pages/Signup/signup.dart';
import 'package:the_eye/Pages/Videos%20Home/Videos%20Home.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20user.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';

import 'Common/Themes/Input Decoration.dart';
import 'Common/Widgets/SnackBar.dart';
import 'Pages/Creator Home/creator_home.dart';
import 'Pages/Start/start.dart';
import 'amplifyconfiguration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Amplify.addPlugins([AmplifyStorageS3(), AmplifyAuthCognito()]);
  await Amplify.configure(amplifyconfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          '/start': (context) => const Start(),
          '/login': (context) => const Login(),
          '/signup': (context) => const Signup(),
          '/profiles': (context) => const Profiles(),
          '/videoHome': (context) => const VideosHome(),
        },
        home: FutureBuilder(
          future: _getInitialScreen(),
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return snapshot.data ?? const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<Widget> _getInitialScreen() async {
    print('Getting initial screen...'); // Add this line
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;

    if (currentUser != null) {
      var user = await getUser(currentUser.uid);
      print('User data: $user'); // Add this line
      if (user is Creator) {
        return const CreatorHome();
      } else if (user is Parent) {
        return const Profiles();
      }
    }
    // If no user is signed in, return the OnBoarding screen as default
    return const OnBoarding();
  }
}