import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  double _buttonRadius = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            _circularAnimationButton(),
          ],
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return Container(
      color: Colors.blue,
    );
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
