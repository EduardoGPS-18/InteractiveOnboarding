import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final Color color;
  final double fillAmount;

  const AppButton({
    Key? key,
    this.onTap,
    required this.child,
    required this.color,
    required this.fillAmount,
  }) : super(key: key);

  factory AppButton.primary({required VoidCallback? onTap, required Widget child, double fillAmount = 1000}) {
    return AppButton(
      color: AppColors.purple,
      onTap: onTap,
      fillAmount: fillAmount,
      child: child,
    );
  }

  factory AppButton.secondary({required VoidCallback? onTap, required Widget child, double fillAmount = 1000}) {
    return AppButton(
      color: AppColors.blackWithOpacity,
      onTap: onTap,
      fillAmount: fillAmount,
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
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              width: fillAmount,
            ),
            child
          ],
        ),
      ),
    );
  }
}
