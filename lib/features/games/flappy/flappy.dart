import 'package:d2ystore/features/games/flappy/game/flappy_bird_game.dart';
import 'package:d2ystore/features/games/flappy/screens/game_over_screen.dart';
import 'package:d2ystore/features/games/flappy/screens/main_menu_screen.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Flappy extends StatelessWidget {
  static const routeName = '/flappy';

  const Flappy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = FlappyBirdGame();

    return GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    );
  }
}
