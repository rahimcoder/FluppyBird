import 'dart:async';

import 'package:flame/components.dart';

class Backround extends SpriteComponent {
  Backround(Vector2 size) : super(size: size, position: Vector2(0, 0));

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('backround.png');
  }
}
