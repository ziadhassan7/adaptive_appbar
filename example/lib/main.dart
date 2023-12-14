import 'package:adaptive_appbar/adaptive_appbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Theme
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),

        //Home
        home: const HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Implementation !!!
      appBar: AdaptiveAppBar(
        context,
        title: "Awesome AppBar",
        onBackPressed: () {},

        //Extras:
        // Title for back button (Shows only on big screens)
        //backButtonTitle: "Discard",
        // Custom background color
        //backgroundColor: Colors.blue,
        // Custom foreground color
        //foregroundColor: Colors.white,
        // Custom widget at the end of the AppBar
        //widget: const Icon(Icons.access_alarm),
      ),

    );
  }
}


