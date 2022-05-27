import 'package:flutter/material.dart';

class CustomAnimatedOpacity extends StatefulWidget {
  final void Function(AnimationController controller) exposeController;
  final Widget child;

  const CustomAnimatedOpacity({
    Key? key,
    required this.exposeController,
    required this.child,
  }) : super(key: key);

  @override
  State<CustomAnimatedOpacity> createState() => _AnimatedOpacityState();
}

class _AnimatedOpacityState extends State<CustomAnimatedOpacity> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      lowerBound: 255,
      upperBound: 255,
      duration: const Duration(milliseconds: 1000),
    );
    widget.exposeController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Opacity(
          opacity: controller.value,
          child: widget.child,
        );
      },
    );
  }
}
