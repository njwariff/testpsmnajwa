//import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:testpsm/provider/posts.dart';
import 'package:testpsm/screen/home_one.dart' show HomeOne;
import 'package:flutter/material.dart';



Future  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => PostsProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch:  Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/images/umpiNtel.png',
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor: Colors.blueAccent,
        duration: 3000,
        nextScreen: HomeOne(),

      ),
    ),
  );
  }
