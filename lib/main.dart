import 'package:flutter/material.dart';

import 'presentation/onboard/onboard.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardPage(
        presenter: OnboardPresenter(),
      ),
    );
  }
}
