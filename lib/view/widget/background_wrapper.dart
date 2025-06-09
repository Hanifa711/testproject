import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget? child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white,),
        Positioned.fill(
          child: Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
          ),
        ),
       
        child ?? Container(),
      ],
    );
  }
}
