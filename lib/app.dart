import 'package:lightapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LightApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 252, 205, 117)),
        useMaterial3: true,
        textTheme: GoogleFonts.acmeTextTheme(),
      ),
      home: const HomePage(
        title: 'LightApp',
      ),
    );
  }
}