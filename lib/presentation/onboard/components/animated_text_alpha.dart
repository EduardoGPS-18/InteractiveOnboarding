import 'package:flutter/material.dart';

class AnimatedTextAlpha extends StatefulWidget {
  final void Function(AnimationController Function() controller) exposeController;
  final List<String> texts;

  const AnimatedTextAlpha({
    Key? key,
    required this.exposeController,
    required this.texts,
  }) : super(key: key);
  @override
  State<AnimatedTextAlpha> createState() => _AnimatedTextAlphaState();
}

class _AnimatedTextAlphaState extends State<AnimatedTextAlpha> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      upperBound: 255,
      value: 255,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 100),
    );
    widget.exposeController(() => controller);
    controller.addListener(() {
      if (controller.value == 0) {
        currentIndex++;
        if (currentIndex > widget.texts.length - 1) {
          currentIndex = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.texts[currentIndex],
      style: TextStyle(
        color: Colors.white.withAlpha(
          controller.value.toInt(),
        ),
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
