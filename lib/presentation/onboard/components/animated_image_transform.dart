import 'package:flutter/cupertino.dart';

class AnimatedImageTransform extends StatefulWidget {
  final void Function(AnimationController controller) exposeController;
  final Widget? child;

  const AnimatedImageTransform({
    Key? key,
    required this.exposeController,
    this.child,
  }) : super(key: key);

  @override
  State<AnimatedImageTransform> createState() => _AnimatedImageTransformState();
}

class _AnimatedImageTransformState extends State<AnimatedImageTransform> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 50,
      value: 0,
    );

    controller.addListener(() {
      if (controller.value == controller.upperBound) {
        controller.reverse();
      }
    });
    widget.exposeController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -controller.value, 0),
      child: widget.child,
    );
  }
}
