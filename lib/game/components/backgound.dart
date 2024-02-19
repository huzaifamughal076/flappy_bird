import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/assets/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Backgound extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Backgound();

  @override
  FutureOr<void> onLoad() async {
    final backgound = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(backgound);
  }
}
