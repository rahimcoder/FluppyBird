import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:fluppy_bird/component/constant.dart';
import 'package:fluppy_bird/component/ground.dart';
import 'package:fluppy_bird/screen/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  //initialize birs position
  Bird()
      : super(
            position: Vector2(birdStartx, birdStarty),
            size: Vector2(birdWidth, birdHeight));

  //physical worl propertise

  double velocity = 0;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('bird.png');

    add(RectangleHitbox());
  }

  //jump
  void flap() {
    velocity = jumpStrenth;
  }

  //update
  @override
  void update(double value) {
    velocity += gravity * value;

    position.y += velocity * value;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);

    if (other is Ground) {
      (parent as FlappyBird).gameOver();
    }
  }
}
