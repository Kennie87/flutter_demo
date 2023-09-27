import 'dart:math';

import 'package:flutter/material.dart';


class Lobster extends StatelessWidget {
  final int lobsterSpriteCount;
  final int lobsterHitCount;
  final String lobsterDirection;

  Lobster({required this.lobsterSpriteCount, required this.lobsterDirection, required this.lobsterHitCount});

  @override
  Widget build(BuildContext context){
    if(lobsterDirection == 'hit'){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 150,
        width: 150,
        child: Image.asset('lib/gameImages/lobsterH' + 
            lobsterSpriteCount.toString() + 
            '.png'),
      );
    }

    if(lobsterDirection == 'left'){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 150,
        width: 150,
        child: Image.asset('lib/gameImages/lobsterWL' + 
            lobsterSpriteCount.toString() + 
            '.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 150,
          width: 150,
          child: Image.asset('lib/gameImages/lobsterWL' + 
            lobsterSpriteCount.toString() + 
            '.png'),
        ),
      );
    }
  }
}