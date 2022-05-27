import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class Loginbutton extends StatefulWidget {
  final void Function(AnimationController Function() controller) exposeController;
  final bool? horizontal;
  final String text;
  final VoidCallback? onTap;

  const Loginbutton({
    Key? key,
    required this.exposeController,
    required this.onTap,
    required this.text,
    this.horizontal,
  }) : super(key: key);

  @override
  State<Loginbutton> createState() => _LoginbuttonState();
}

class _LoginbuttonState extends State<Loginbutton> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  int animCount = 0;
  bool hasAnimated = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      value: widget.horizontal == true ? 500 : 52,
      reverseDuration: const Duration(milliseconds: 120),
      upperBound: widget.horizontal == true ? 500 : 52,
      lowerBound: widget.horizontal == true ? 15 : 0,
    );

    widget.exposeController(() => controller);
    controller.addListener(() {
      if (controller.value == controller.lowerBound) {
        controller.animateTo(controller.upperBound);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, ch) => AppButton.primary(
        animateHorizontal: true,
        onTap: widget.onTap,
        fillAmount: controller.value,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.only(left: 52)),
            const Spacer(),
            Center(
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }
}
