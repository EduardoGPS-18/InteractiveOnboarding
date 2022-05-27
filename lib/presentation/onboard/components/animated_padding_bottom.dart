import 'package:flutter/cupertino.dart';

class AnimatedPaddingBottom extends StatefulWidget {
  final Widget child;
  final void Function(AnimationController controller) exposeController;
  const AnimatedPaddingBottom({
    Key? key,
    required this.child,
    required this.exposeController,
  }) : super(key: key);

  @override
  State<AnimatedPaddingBottom> createState() => _AnimatedPaddingBottomState();
}

class _AnimatedPaddingBottomState extends State<AnimatedPaddingBottom> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      upperBound: 20,
    );
    widget.exposeController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Container(
          padding: EdgeInsets.only(bottom: controller.value),
          child: widget.child,
        );
      },
    );
  }
}
