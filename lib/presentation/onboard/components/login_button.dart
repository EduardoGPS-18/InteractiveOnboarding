import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class Loginbutton extends StatefulWidget {
  final void Function(AnimationController Function() controller) exposeController;

  final VoidCallback? onTap;

  const Loginbutton({
    Key? key,
    required this.exposeController,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Loginbutton> createState() => _LoginbuttonState();
}

class _LoginbuttonState extends State<Loginbutton> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      value: 500,
      upperBound: 500,
      lowerBound: 25,
    );
    widget.exposeController(() => controller);
    controller.addListener(() {
      if (controller.value == controller.lowerBound) {
        controller.animateTo(controller.upperBound);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, ch) => AppButton.primary(
        onTap: widget.onTap,
        fillAmount: controller.value,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Padding(padding: EdgeInsets.only(left: 52)),
            Spacer(),
            Center(
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 32),
          ],
        ),
      ),
    );
  }
}
