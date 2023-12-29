import 'package:flutter/material.dart';
import 'package:flutter_samples/mask_text/mask_text.dart';
import 'package:flutter_samples/slide_to_act/slide_to_act.dart';
import 'package:flutter_samples/zoom_view/zoom_view.dart';

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
      theme: ThemeData.dark(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const ZoomView(),
    );
  }
}
