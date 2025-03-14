import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slideAnimation,
  });

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (BuildContext context, _) => SlideTransition(
        position: slideAnimation,
        child: const Text(
          "Read free Books",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
