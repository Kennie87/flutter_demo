import 'dart:math';

import 'package:flutter/material.dart';


class Cellion extends StatelessWidget {
  final int cellionSpriteCount;
  final String cellionDirection;
  final int cellionAttack;
 
  Cellion({required this.cellionSpriteCount, required this.cellionDirection, required this.cellionAttack});

  @override
  Widget build(BuildContext context){
    if(cellionDirection == 'attack'){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 75,
        width: 75,
        child: Image.asset('lib/gameImages/cellionA' + 
            cellionAttack.toString() + 
            '.png'),
      );
    } 

    if(cellionDirection == 'left'){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 75,
        width: 75,
        child: Image.asset('lib/gameImages/cellionWL' + 
            cellionSpriteCount.toString() + 
            '.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 75,
          width: 75,
          child: Image.asset('lib/gameImages/cellionWL' + 
            cellionSpriteCount.toString() + 
            '.png'),
        ),
      );
    }
  }
}