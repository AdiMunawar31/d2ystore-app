import 'package:d2ystore/constants/flappy_assets.dart';
import 'package:d2ystore/features/games/flappy/game/configuration.dart';
import 'package:d2ystore/features/games/flappy/game/flappy_bird_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> {
  Ground();

  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(FlappyAssets.ground);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(ground, fill: LayerFill.none),
      ),
    ]);
    add(
      RectangleHitbox(
        position: Vector2(0, gameRef.size.y - Config.groundHeight),
        size: Vector2(gameRef.size.x, Config.groundHeight),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
