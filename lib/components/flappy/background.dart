import 'dart:async';

import 'package:d2ystore/constants/flappy_assets.dart';
import 'package:d2ystore/features/games/flappy/game/flappy_bird_game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(FlappyAssets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
