import 'package:flutter/material.dart';
import 'package:flutter_samples/animations/implicit_animation/view/implicit_animation_view.dart';
import 'package:flutter_samples/animations/multiple_type.dart';
import 'package:flutter_samples/animations/zoom_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ImplicitAnimationView(),
    );
  }
}
