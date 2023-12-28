import 'package:d2ystore/constants/flappy_assets.dart';
import 'package:d2ystore/features/games/flappy/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(FlappyAssets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(FlappyAssets.message),
        ),
      ),
    );
  }
}
