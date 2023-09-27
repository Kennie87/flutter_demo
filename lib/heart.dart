import 'dart:math';
import 'package:flutter/material.dart';


class Heart extends StatelessWidget {
  final int heartSpriteCount;
  final bool on;


  Heart({required this.heartSpriteCount, required this.on});

  @override
  Widget build(BuildContext context){
    if(on){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset('lib/gameImages/heart' + 
            heartSpriteCount.toString() + 
            '.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset('lib/gameImages/heart0.png'),
        ),
      );
    }
  }
}