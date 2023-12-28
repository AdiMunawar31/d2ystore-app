import 'package:d2ystore/constants/flappy_assets.dart';
import 'package:d2ystore/features/games/flappy/game/configuration.dart';
import 'package:d2ystore/features/games/flappy/game/flappy_bird_game.dart';
import 'package:d2ystore/features/games/flappy/game/pipe_position.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(FlappyAssets.pipe);
    final pipeRotated = await Flame.images.load(FlappyAssets.pipeRotated);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
