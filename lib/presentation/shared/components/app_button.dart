import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final Color color;
  final double fillAmount;
  final bool? animateHorizontal;

  const AppButton({
    Key? key,
    this.onTap,
    required this.child,
    required this.color,
    required this.fillAmount,
    this.animateHorizontal,
  }) : super(key: key);

  factory AppButton.primary({
    required VoidCallback? onTap,
    required Widget child,
    double fillAmount = 1000,
    bool? animateHorizontal,
  }) {
    return AppButton(
      color: AppColors.purple,
      onTap: onTap,
      fillAmount: fillAmount,
      animateHorizontal: animateHorizontal,
      child: child,
    );
  }

  factory AppButton.secondary({
    required VoidCallback? onTap,
    required Widget child,
    double fillAmount = 1000,
    bool? animateHorizontal,
  }) {
    return AppButton(
      color: AppColors.blackWithOpacity,
      onTap: onTap,
      fillAmount: fillAmount,
      animateHorizontal: animateHorizontal,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 32,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        height: 52,
        child: Stack(
          alignment: animateHorizontal == false ? Alignment.bottomCenter : Alignment.centerLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              width: animateHorizontal == true ? fillAmount : null,
              height: animateHorizontal == false ? fillAmount : null,
            ),
            child
          ],
        ),
      ),
    );
  }
}
