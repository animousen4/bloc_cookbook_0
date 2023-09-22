import 'package:bloc_cookbook_0/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

// Root Widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
