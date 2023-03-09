import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with TickerProviderStateMixin {
  double _buttonRadius = 100;
  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);
  AnimationController? _starAnimationController;
  AnimationController? _imageAnimationController;

  @override
  void initState() {
    super.initState();
    _starAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    _starAnimationController!.repeat();

    _imageAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _imageAnimationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_circularAnimationButton(), _imageAnimation(), _starIconAnimation()],
            )
          ],
        ),
      ),
    );
  }

  Widget _imageAnimation() {
    return AnimatedBuilder(
        animation: _imageAnimationController!.view,
        builder: (buildContext, child) {
          return Transform.translate(offset: Offset(_imageAnimationController!.value, _imageAnimationController!.value * -60,), child: child,);
        },
        child: const Icon(
          Icons.sports_soccer,
          size: 100,
          color: Colors.amber,
        ));
  }

  Widget _starIconAnimation() {
    return AnimatedBuilder(
        animation: _starAnimationController!.view,
        builder: (buildContext, child) {
          return Transform.rotate(
            angle: _starAnimationController!.value * 2 * pi,
            child: child,
          );
        },
        child: const Icon(
          Icons.star,
          size: 100,
          color: Colors.amber,
        ));
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
        tween: _backgroundScale,
        curve: Curves.easeInOutCubicEmphasized,
        duration: const Duration(seconds: 2),
        builder: (context, double scale, child) {
          return Transform.scale(scale: scale, child: child);
        },
        child: Container(
          color: Colors.blue,
        ));
  }

  Widget _circularAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonRadius += _buttonRadius == 200 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.bounceInOut,
          height: _buttonRadius,
          width: _buttonRadius,
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(100)),
          child: const Center(
              child: Text(
            "Basic",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
