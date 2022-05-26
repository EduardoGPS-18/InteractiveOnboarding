// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:onboarding_interaction/presentation/onboard/onboard.dart';
import 'package:onboarding_interaction/presentation/theme/app_assets.dart';
import 'package:onboarding_interaction/presentation/theme/theme.dart';

import '../shared/components/components.dart';
import 'components/components.dart';

class OnboardPage extends StatefulWidget {
  final OnboardPresenter presenter;

  const OnboardPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final AnimationController opacityController;
  AnimationController? loginButtonFillController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(seconds: 0),
      upperBound: 10,
      value: 5,
    );

    controller.addStatusListener((status) {});
    controller.addListener(() {
      setState(() {
        if (controller.value == controller.upperBound) {
          controller.value = 0;
          setState(() {});
          controller.animateTo(5);
        }
        setState(() {});
      });
    });
  }

  String text = "teste";
  int val = 0;
  void inc() {
    if (controller.isAnimating || opacityController.isAnimating) return;
    val++;
    if (val > 2) {
      val = 0;
    }
    loginButtonFillController?.value = 0;
    setState(() {});
    opacityController.animateTo(0);
    controller.animateTo(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                OnboardImages.peopleWalking.path,
                height: 350,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 12),
                  PageIndicator(
                    active: val == 0,
                  ),
                  AnimatedContainer(
                    width: val == 1 || val == 0 ? 18 : 12,
                    duration: const Duration(milliseconds: 500),
                  ),
                  PageIndicator(
                    active: val == 1,
                  ),
                  AnimatedContainer(
                    width: val == 1 || val == 2 ? 18 : 12,
                    duration: const Duration(milliseconds: 500),
                  ),
                  PageIndicator(
                    active: val == 2,
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            const SizedBox(height: 32),
            AnimatedBuilder(
              animation: controller,
              builder: (ctx, ch) => Container(
                transform: Matrix4.translationValues((controller.value - 5) * 5, 0, 0),
                child: AnimatedTextAlpha(
                  exposeController: (controllerExposer) {
                    opacityController = controllerExposer();
                    opacityController.addListener(() {
                      if (opacityController.value == 0) {
                        opacityController.animateTo(255);
                      }
                    });
                  },
                  texts: const [
                    'Flutter Is Awsome 🔥',
                    'Here you can do amazing things 🛠️',
                    'Come on join us Today 🚀',
                  ],
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 12),
            IgnorePointer(
              ignoring: loginButtonFillController?.isAnimating == true,
              child: Loginbutton(
                onTap: inc,
                exposeController: (exposeController) {
                  loginButtonFillController = exposeController();
                },
              ),
            ),
            const SizedBox(height: 12),
            SignupWithGoogleButton(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

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
