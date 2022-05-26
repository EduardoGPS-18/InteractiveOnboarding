import 'package:flutter/material.dart';
import 'package:onboarding_interaction/presentation/theme/app_assets.dart';

import '../../shared/components/components.dart';

class SignupWithGoogleButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SignupWithGoogleButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton.secondary(
      onTap: onTap,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(OnboardIcons.googleLogo.path, height: 20),
            const SizedBox(width: 12),
            const Text(
              'Sign up with Google',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
