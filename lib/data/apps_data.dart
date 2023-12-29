import 'package:d2ystore/features/app/calculator/calculator.dart';
import 'package:d2ystore/features/app/quotes/quotes.dart';
import 'package:d2ystore/features/games/flappy/flappy.dart';
import 'package:d2ystore/features/games/snake/snake.dart';
import 'package:d2ystore/models/app_item.dart';

List<AppItem> apps = [
  AppItem(
    name: 'Notes',
    rating: 4.8,
    image: 'assets/images/apps/notes.png',
    routeName: Flappy.routeName,
  ),
  AppItem(
    name: 'Quotes',
    rating: 2.5,
    image: 'assets/images/apps/quotes.jpg',
    routeName: Quotes.routeName,
  ),
  AppItem(
    name: 'Calculator',
    rating: 3.0,
    image: 'assets/images/apps/calculator.png',
    routeName: Calculator.routeName,
  ),
  AppItem(
    name: 'Weather',
    rating: 3.5,
    image: 'assets/images/apps/weather.png',
    routeName: Snake.routeName,
  ),
];
