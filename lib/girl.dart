import 'dart:math';

import 'package:flutter/material.dart';


class Girl extends StatelessWidget {
  final int girlSpriteCount;
  final String girlDirection;

  Girl({required this.girlSpriteCount, required this.girlDirection});

  @override
  Widget build(BuildContext context){
    if(girlDirection == 'attack'){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 150,
        child: Image.asset('lib/gameImages/girlAttack.png'),
      );
    }

    if(girlDirection == 'left'){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 150,
        width: 150,
        child: Image.asset('lib/gameImages/girlWL' + 
            girlSpriteCount.toString() + 
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
          child: Image.asset('lib/gameImages/girlWL' + 
            girlSpriteCount.toString() + 
            '.png'),
        ),
      );
    }
  }
}