import 'package:flutter/material.dart';

class AnimatedImageOpacity extends StatefulWidget {
  final String imagePath;
  final void Function(AnimationController controller) exposeController;

  const AnimatedImageOpacity({
    Key? key,
    required this.exposeController,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<AnimatedImageOpacity> createState() => _AnimatedImageOpacityState();
}

class _AnimatedImageOpacityState extends State<AnimatedImageOpacity> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 500),
    );

    controller.addListener(() {
      if (controller.value == 0) {
        controller.animateTo(1);
      }
    });
    widget.exposeController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Image.asset(
        widget.imagePath,
        height: 350,
        opacity: controller,
      ),
    );
  }
}
