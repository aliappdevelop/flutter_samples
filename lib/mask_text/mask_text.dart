import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MaskText extends StatelessWidget {
  const MaskText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF27374D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //AssetImage('assets/images/tech.jpg'),
            Text(
              'HELLO',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            MaskedImage(
              image: AssetImage('assets/images/nature_1.jpg'),
              child: Text(
                'HELLO',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaskedImage extends StatelessWidget {
  final Widget child;
  final AssetImage image;

  const MaskedImage({required this.image, required this.child, super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder<ui.Image>(
        future: loadImage(),
        builder: (context, snap) => snap.hasData
            ? ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => ImageShader(
                  snap.data!,
                  TileMode.mirror,
                  TileMode.mirror,
                  Matrix4.identity().storage,
                ),
                child: child,
              )
            : Container(),
      );

  Future<ui.Image> loadImage() async {
    final completer = Completer<ui.Image>();
    final stream = image.resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener((info, _) => completer.complete(info.image)));

    return completer.future;
  }
}
