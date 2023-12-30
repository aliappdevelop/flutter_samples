import 'package:flutter/material.dart';
import 'package:flutter_samples/animations/implicit_animation/model/implicit_animation_model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ImplicitAnimationView extends StatefulWidget {
  const ImplicitAnimationView({super.key});

  @override
  State<ImplicitAnimationView> createState() => _ImplicitAnimationViewState();
}

class _ImplicitAnimationViewState extends State<ImplicitAnimationView> {
  double myAngle = 0.0;
  Color? selectedColor;
  int selectedIndex = 0;

  final itemController = ItemScrollController();

  List<Color> colorList = [
    const Color(0xFF5C8374),
    const Color(0xFFE3651D),
    const Color(0xFF818FB4),
    const Color(0xFFDA0C81),
    const Color(0xFF005B41),
    const Color(0xFFAE445A),
    const Color(0xFFB9B4C7),
    const Color(0xFF4E3636),
    const Color(0xFF46C2CB),
    const Color(0xFFDCBFFF),
    const Color(0xFFFAAB78),
  ];

  @override
  void initState() {
    super.initState();

    selectedColor = colorList[selectedIndex];
  }

  Future scrollToItem() async {
    itemController.jumpTo(
      index: selectedIndex,
      alignment: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor!.withOpacity(0.5),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -170,
            child: AnimatedRotation(
              curve: Curves.fastEaseInToSlowEaseOut,
              duration: const Duration(seconds: 1),
              turns: myAngle,
              child: CircleAvatar(
                backgroundColor: selectedColor!.withOpacity(0.31),
                radius: 210,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -81,
                      left: (MediaQuery.of(context).size.width / 2) - 81,
                      child: CircleAvatar(
                        radius: 81,
                        backgroundColor: selectedColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ScrollablePositionedList.builder(
              itemCount: colorList.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemScrollController: itemController,
              itemBuilder: (context, index) {
                return Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () => animation(index),
                    child: Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorList[index],
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: Visibility(
                        visible: index == selectedIndex,
                        child: const Icon(
                          Icons.done_outline_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 570,
            left: (MediaQuery.of(context).size.width / 2) - 90,
            child: InkWell(
              onTap: () => selectedIndex != 0 ? animation(selectedIndex -= 1) : null,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: selectedIndex == 0 ? colorList[0] : colorList[selectedIndex - 1],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 570,
            right: (MediaQuery.of(context).size.width / 2) - 90,
            child: InkWell(
              onTap: () => animation(selectedIndex += 1),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: selectedIndex >= colorList.length - 1 ? colorList[0] : colorList[selectedIndex + 1],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: selectedColor,
        onPressed: () => animation(selectedIndex += 1),
        child: const Icon(
          Icons.rotate_right_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  animation(int index) {
    setState(() {
      myAngle += 1;
      if (selectedIndex >= colorList.length) {
        selectedIndex = 0;
      } else {
        selectedIndex = index;
      }
      selectedColor = colorList[selectedIndex];
    });
    scrollToItem();
  }
}
