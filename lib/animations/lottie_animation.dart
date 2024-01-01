import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Lottie.network(
          'https://lottie.host/7c2ec907-7afd-43ba-9183-bb5d1eb9dd34/G2PHrQskuv.json',
        ),
      ),
    );
  }
}
