import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:fluppy_bird/component/backround.dart';
import 'package:fluppy_bird/component/constant.dart';
import 'package:fluppy_bird/component/ground.dart';
import 'package:flutter/material.dart';

import '../component/bird.dart';

class FlappyBird extends FlameGame with TapDetector, HasCollisionDetection {
/*
Game Component 
-Bird
-backround
-ground
-pipes
score
*/

  late Bird bird;
  late Backround backround;
  late Ground ground;
  @override
  FutureOr<void> onLoad() {
    //load backround
    backround = Backround(size);
    add(backround);
//load bird
    bird = Bird();
    add(bird);
    ground = Ground();
    add(ground);
  }

  @override
  void onTap() {
    bird.flap();
  }

  bool isGameOver = false;
  void gameOver() {
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();
    showDialog(
        context: buildContext!,
        builder: (context) => AlertDialog(
              title: Text('Game Over'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      resetGame();
                    },
                    child: Text('Restart'))
              ],
            ));
  }

  void resetGame() {
    bird.position = Vector2(birdStartx, birdStarty);
    bird.velocity = 0;
    isGameOver = false;
    resumeEngine();
  }
}
