import 'package:d2ystore/features/games/flappy/flappy.dart';
import 'package:d2ystore/features/games/snake/snake.dart';
import 'package:d2ystore/models/game_item.dart';

List<GameItem> games = [
  GameItem(
    name: 'Flappy Bird',
    rating: 4.5,
    image: 'assets/images/games/flappy.png',
    routeName: Flappy.routeName,
  ),
  GameItem(
    name: 'Wordle',
    rating: 4.0,
    image: 'assets/images/games/wordle.png',
    routeName: Flappy.routeName,
  ),
  GameItem(
    name: 'Snake',
    rating: 3.5,
    image: 'assets/images/games/snake.png',
    routeName: Snake.routeName,
  ),
  GameItem(
    name: 'Chess',
    rating: 3.5,
    image: 'assets/images/games/chess.png',
    routeName: Snake.routeName,
  ),
];
