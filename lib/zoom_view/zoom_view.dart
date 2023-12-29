import 'package:flutter/material.dart';

const defaultWidth = 100.0;

class ZoomView extends StatefulWidget {
  const ZoomView({super.key});

  @override
  State<ZoomView> createState() => _ZoomViewState();
}

class _ZoomViewState extends State<ZoomView> {
  var _isZoomIn = false;
  var _buttonTitle = 'Zoom In';

  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoom'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 370,
                ),
                curve: _curve, //Remove if no animation required.
                width: _width,
                child: Image.asset('assets/images/nature.jpg'),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isZoomIn = !_isZoomIn;
                _buttonTitle = _isZoomIn ? 'Zoom Out' : 'Zoom In';
                _width = _isZoomIn ? MediaQuery.of(context).size.width : defaultWidth;
                _curve = _isZoomIn ? Curves.bounceInOut : Curves.bounceOut;
              });
            },
            child: Text(
              _buttonTitle,
            ),
          ),
        ],
      ),
    );
  }
}
