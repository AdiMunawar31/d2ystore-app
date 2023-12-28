import 'package:d2ystore/constants/flappy_assets.dart';
import 'package:d2ystore/features/games/flappy/game/configuration.dart';
import 'package:d2ystore/features/games/flappy/game/flappy_bird_game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

class Clouds extends ParallaxComponent<FlappyBirdGame> {
  Clouds();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load(FlappyAssets.clouds);
    position = Vector2(x, -(gameRef.size.y - Config.cloudsHeight));
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(image, fill: LayerFill.none),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
