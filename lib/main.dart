import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/cellion.dart';
import 'package:flutter_demo/cellionBlast.dart';
import 'package:flutter_demo/girl.dart';
import 'package:flutter_demo/heart.dart';
import 'package:flutter_demo/lobster.dart';

import 'button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Lobster 
  int lobsterSpriteCount = 1;
  double lobsterPosX = 0.9;
  double lobsterPosY = 1.04100;
  String lobsterDirection = 'left';
  int lobsterHitCount = 1;

  //Cellion 
  int cellionSpriteCount = 1;
  double cellionPosX = -0.9;
  double cellionPosY = 1.06100;
  String cellionDirection = 'right';
  int cellionAttack = 0;
  bool blast = false;
  double blastPosX = 0.00;
  double blastPosY = 0;
  int blastChange = 0;
  double forwardBlast = 0.0001;
  double help = 0.10;

  //Girl 
  int girlSpriteCount = 1;
  double girlPosX = -0.8;
  double girlPosY = 1.04100;
  String girlDirection = 'right';
  int attackChange = 3;
  int jumpChange = 0;
  int girlHitCount = 0;
  int damageCount = 1;


  //health bar
  var colorChange = Colors.black;
  int hitScore = 0;
  int heartSpriteCount = 0;
  bool on = false;
  int spinStop = 0;

  //end of game
  var endGame = Colors.transparent;
  var endCaption = Colors.transparent;
  

  void startGame(){
    moveLobster();
    healthCount();
  }

  void lobsterHit(){
    Timer.periodic(Duration(milliseconds: 250), (timer) {
      setState(() {
        lobsterDirection = 'hit';
        hitScore++;
          lobsterHitCount ++;
          if(lobsterHitCount == 4){
            timer.cancel();
            lobsterDirection = 'hit';
            lobsterHitCount = 1;
            healthCount();
            damageCount ++;
          }
      });
     });
  }

  void moveLobster(){
    Timer.periodic(Duration(milliseconds: 110), (timer) {
      setState(() {
        lobsterSpriteCount++;
        
        if (lobsterDirection == 'left'){
          lobsterPosX -= 0.01;
        } else {
          lobsterPosX += 0.01;
        }

        if (lobsterPosX < 0.3){
          lobsterDirection = 'right';
        } else if(lobsterPosX > 0.7){
          lobsterDirection = 'left';
        }

        if (lobsterPosX <= forwardBlast){
          lobsterHit();
        }

        if (lobsterSpriteCount == 6){
          lobsterSpriteCount = 1;
        }
      });
    });
  }

  void helpHealth(){
    Timer.periodic(Duration(milliseconds: 130), (timer) {
      setState(() {
        on = true;
        heartSpriteCount++;
        if(heartSpriteCount == 11){
          heartSpriteCount = 1;
          spinStop++;
        }

        if(girlPosX == -1.1300000000000003){
          damageCount --;
          lobsterHitCount -2;
          on = false;
          healthCount();
          timer.cancel();
        }

        if(spinStop == 10){
          on = false;
          timer.cancel();
        }
      });
     });
  }
  
  void healthCount(){
    if(damageCount == 1){
      colorChange =  Colors.pink;
    }

    if(damageCount == 2){
      colorChange = const Color.fromARGB(255, 220, 104, 142);
        } 
      if(damageCount == 3){
      colorChange = const Color.fromARGB(255, 211, 146, 168);
        }

      if(damageCount == 4){
      colorChange = const Color.fromARGB(255, 210, 210, 210);
      helpHealth();
        }  
      
      if(damageCount == 5){
        colorChange = Colors.red;
      }

      if(damageCount == 6){
        endGame = Colors.pink;
        endCaption = Colors.black;
      }
  }

  void moveLeft(){
    setState(() {
      girlPosX -= 0.03;
      girlSpriteCount++;
      girlDirection = 'left';
    });

    if (girlSpriteCount == 6){
          girlSpriteCount = 1;
        }

    if(cellionSpriteCount == 5){
          cellionSpriteCount = 1;
        }

        if ((cellionPosX - girlPosX).abs() > 0.2){
          if(girlDirection == 'right'){
            cellionPosX = girlPosX - 0.2;
          } else if (girlDirection == 'left'){
            cellionPosX = girlPosX + 0.2;
          }
        }

        if(cellionPosX - girlPosX > 0){
          cellionDirection = 'left';
        } else {
          cellionDirection = 'right';
        }
        cellionSpriteCount++;

        
  }

  void moveRight(){
    setState(() {
      girlPosX += 0.03;
      girlSpriteCount++;
      girlDirection = 'right';
    });

    if (girlSpriteCount == 6){
          girlSpriteCount = 1;
        }

    if(cellionSpriteCount == 5){
          cellionSpriteCount = 1;
        }

        if ((cellionPosX - girlPosX).abs() > 0.2){
          if(girlDirection == 'right'){
            cellionPosX = girlPosX - 0.2;
          } else if (girlDirection == 'left'){
            cellionPosX = girlPosX + 0.2;
          }
        }

        if(cellionPosX - girlPosX > 0){
          cellionDirection = 'left';
        } else {
          cellionDirection = 'right';
        }
        cellionSpriteCount++;
  }
  void moveBlast(){
    Timer.periodic(Duration(milliseconds: 170), (timer) {
      setState(() {
        if(blastChange < 5){
          blast = true;
          help + 0.05;
          blastPosX = cellionPosX + 0.03;
          forwardBlast = forwardBlast + help;
          blastPosY = cellionPosY;
          blastChange++;
        } 
        if(blastChange == 5){
          timer.cancel();
          blast = false;
          help = 0.10;
          forwardBlast = 0.0001;
          blastChange = 0;
        }
      });
     });
  }
  
  void attackMove(){
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      setState(() {
        cellionDirection = 'attack';
        cellionAttack ++;
        girlDirection = 'attack';
        attackChange++;
        
        
        if(attackChange > 11){
          girlDirection = 'right';
          cellionDirection = 'right';
        }

        if(attackChange == 12){
          cellionAttack = 0;
          attackChange = 0;
          moveBlast();
          timer.cancel();
        }
      });
     });
  }

  void jump(){
    Timer.periodic(Duration(milliseconds: 70), (timer) {
      setState(() {
        if(jumpChange < 4){
          girlPosY = girlPosY - 0.03;
          jumpChange++;
        } else {
          girlPosY = girlPosY + 0.03;
        }

        if(girlPosY == 1.04100){
          girlPosY = 1.04100;
          timer.cancel();
          jumpChange = 0;
        }
      });
     });
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue[300],
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('SCORE: ' + hitScore.toString(), 
                      style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 25)),
                  ),
                  Container(
                    alignment: Alignment(lobsterPosX, lobsterPosY),
                    child: Lobster(lobsterSpriteCount: lobsterSpriteCount, 
                          lobsterDirection: lobsterDirection, lobsterHitCount: lobsterHitCount),
                  ),
                  Container(
                    alignment: Alignment(-0.9, 1.0000),
                    child: Heart(heartSpriteCount: heartSpriteCount, on: on),
                  ),
                  Container(
                    alignment: Alignment(cellionPosX, cellionPosY),
                    child: Cellion(cellionSpriteCount: cellionSpriteCount, 
                          cellionDirection: cellionDirection, cellionAttack: cellionAttack,),
                  ),
                  Container(
                    alignment: Alignment(forwardBlast, blastPosY),
                    child: CellionBlast(blast: blast),
                  ),
                  Container(
                    alignment: Alignment(girlPosX, girlPosY),
                    child: Girl(girlSpriteCount: girlSpriteCount, 
                          girlDirection: girlDirection),
                  ),
                  Container(
                    color: endGame,
                    child: Center(
                      child: Text('G A M E   O V E R' ,
                      style: TextStyle(color: endCaption, 
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.green[600],
          ),
          Expanded(
            child: Container(
              color: Colors.grey[500],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('D e M o  -  G a M e', 
                    style: TextStyle(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                          padding: EdgeInsetsDirectional.all(15),
                          color: colorChange,
                        ),
                      ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    text: 'Play',
                    function: (){
                      startGame();
                    },
                  ),
                  MyButton(
                    text: 'Attack',
                    function: (){
                      attackMove();
                    },
                  ),
                  MyButton(
                    text: '←',
                    function: (){
                      moveLeft();
                    },
                  ),
                  MyButton(
                    text: '↑',
                    function: (){
                      jump();
                    },
                  ),
                  MyButton(
                    text: '→',
                    function: (){
                      moveRight();
                    },
                  )
                ]
              )
                ],) 
            ),
          )
        ],
      ),
    );
  }
}
