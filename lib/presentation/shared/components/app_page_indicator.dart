import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final bool active;

  const PageIndicator({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: active ? 12 : 6,
      width: active ? 12 : 6,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.grey.withOpacity(0.5),
        border: active ? Border.all(color: Colors.white) : null,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          if (active)
            const BoxShadow(
              blurRadius: 30,
              color: Colors.grey,
              spreadRadius: 3,
              blurStyle: BlurStyle.normal,
            )
        ],
      ),
    );
  }
}
