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
  AnimationController? controller;
  AnimationController? opacityController;
  AnimationController? loginButtonFillController;
  AnimationController? animatedImageOpacityController;
  AnimationController? animatedImageTransformController;
  AnimationController? bottomButtonPadding;

  var currentImage = 0;
  bool hasUpdated = false;
  bool showAll = true;

  @override
  void initState() {
    super.initState();
    restart();
  }

  void restart() {
    if (controller != null) {
      controller?.dispose();
    }
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(seconds: 0),
      upperBound: 10,
      value: 5,
    );

    controller?.addStatusListener((status) {});
    controller?.addListener(() {
      setState(() {
        if (controller?.value == controller?.upperBound) {
          controller?.value = 0;
          setState(() {});
          controller?.animateTo(5);
        }
        setState(() {});
      });
    });
  }

  String text = "teste";
  int val = 0;
  void inc() {
    if (bottomButtonPadding?.value == bottomButtonPadding?.upperBound) restart();
    if (controller?.isAnimating == true || opacityController?.isAnimating == true) return;
    val++;
    if (val > 2) {}
    print('CUR $currentImage');
    if (currentImage + 1 > 2) {
      showAll = false;
      setState(() {});
      bottomButtonPadding?.animateTo(bottomButtonPadding!.upperBound);
    }
    opacityController?.animateTo(0);
    controller?.animateTo(10);
    animatedImageOpacityController?.animateTo(0);
    animatedImageTransformController?.animateTo(animatedImageTransformController!.upperBound);
    animatedImageTransformController?.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        hasUpdated = false;
      }
      print(status);
    });
    loginButtonFillController?.animateBack(0);

    animatedImageTransformController?.addListener(() {
      if (animatedImageTransformController?.value == animatedImageTransformController?.upperBound && !hasUpdated) {
        if (currentImage + 1 <= 2) {
          hasUpdated = true;
          currentImage++;
        }
      }
      print(currentImage);
    });
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
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: !showAll ? 0 : 1,
              child: Center(
                child: AnimatedBuilder(
                  animation: controller!,
                  builder: (_, __) {
                    return AnimatedImageTransform(
                      exposeController: (AnimationController controller) =>
                          animatedImageTransformController = controller,
                      child: AnimatedImageOpacity(
                        imagePath: [
                          OnboardImages.personWalking.path,
                          OnboardImages.personOnCellPhone.path,
                          OnboardImages.peoplesOnCellPhone.path
                        ][currentImage],
                        exposeController: (controller) => animatedImageOpacityController = controller,
                      ),
                    );
                  },
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: showAll ? 0 : 1,
              duration: const Duration(milliseconds: 200),
              child: const Center(
                child: Text(
                  'Awesome🚀🚀',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 42),
                ),
              ),
            ),
            const SizedBox(height: 12),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: !showAll ? 0 : 1,
              child: SizedBox(
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
                      duration: const Duration(milliseconds: 250),
                    ),
                    PageIndicator(
                      active: val == 1,
                    ),
                    AnimatedContainer(
                      width: val == 1 || val == 2 ? 18 : 12,
                      duration: const Duration(milliseconds: 250),
                    ),
                    PageIndicator(
                      active: val == 2,
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: !showAll ? 0 : 1,
              child: AnimatedBuilder(
                animation: controller!,
                builder: (ctx, ch) => Container(
                  transform: Matrix4.translationValues((controller!.value - 5) * 5, 0, 0),
                  child: AnimatedTextAlpha(
                    exposeController: (controllerExposer) {
                      opacityController = controllerExposer();
                      opacityController?.addListener(() {
                        if (opacityController?.value == 0) {
                          opacityController?.animateTo(255);
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
            ),
            const Spacer(),
            const SizedBox(height: 12),
            IgnorePointer(
              ignoring: loginButtonFillController?.isAnimating == true,
              child: AnimatedPaddingBottom(
                exposeController: (controller) => bottomButtonPadding = controller,
                child: Loginbutton(
                  text: 'Next',
                  horizontal: true,
                  onTap: inc,
                  exposeController: (exposeController) => loginButtonFillController = exposeController(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: !showAll ? 0 : 1,
              child: SignupWithGoogleButton(
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
