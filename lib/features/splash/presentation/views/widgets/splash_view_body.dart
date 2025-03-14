import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/asset.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sliding_anmation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  @override
  void initState() {
    super.initState();

    navToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          CrossAxisAlignment.stretch, // to take tne maxmum width avalabile
      children: [
        Image.asset(AssetData.logo),
        const SizedBox(height: 6),
        SlidingText(slideAnimation: slideAnimation),
      ],
    );
  }

  void initSlidingAnmation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, 0))
            .animate(animationController);

    animationController
        .forward(); //tells the controller to play the animation forward from its current value to its upper bound.
    // slideAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  void navToHome() {
    initSlidingAnmation();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.to(() => const Home(),
        //     transition: Transition.zoom, duration: kDuration);
        if (mounted) (GoRouter.of(context).push(AppRoutes.kHomeBody),);
      },
    );
  }
}
