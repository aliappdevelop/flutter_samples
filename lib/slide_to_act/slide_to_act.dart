import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToAct extends StatefulWidget {
  const SlideToAct({super.key});

  @override
  State<SlideToAct> createState() => _SlideToActState();
}

class _SlideToActState extends State<SlideToAct> {
  final GlobalKey<SlideActionState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SlideAction(
            key: _key,
            onSubmit: () {},
            borderRadius: 12,
            elevation: 0,
            innerColor: Colors.teal[500],
            outerColor: Colors.teal[300],
            sliderRotate: false,
            sliderButtonIcon: const Icon(
              Icons.currency_rupee,
              color: Colors.white,
            ),
            text: 'Slide to Pay',
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
