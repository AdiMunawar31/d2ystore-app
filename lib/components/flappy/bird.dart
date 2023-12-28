import 'package:d2ystore/features/games/flappy/game/bird_movement.dart';
import 'package:d2ystore/features/games/flappy/game/configuration.dart';
import 'package:d2ystore/features/games/flappy/game/flappy_bird_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:d2ystore/constants/flappy_assets.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  int score = 0;

  @override
  Future<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite(FlappyAssets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(FlappyAssets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(FlappyAssets.birdDownFlap);

    gameRef.bird;

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down,
      ),
    );
    current = BirdMovement.up;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    gameOver();
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    // game.isHit = true;
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
  }
}
