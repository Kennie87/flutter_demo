import 'package:flutter/material.dart';


class CellionBlast extends StatelessWidget {
  final bool blast;

  CellionBlast({required this.blast});

  @override
  Widget build(BuildContext context){
      if(blast){
        return Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 150,
          child: Image.asset('lib/gameImages/cellionBlast.png'),
        );
      } else {
        return Container(
        alignment: Alignment.bottomCenter,
        height: 150,
        width: 150,
        child: Image.asset('lib/gameImages/girlPB1.png'),
      );
      }
    }
}