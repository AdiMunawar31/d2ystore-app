import 'package:d2ystore/features/dashboard.dart';
import 'package:d2ystore/features/games/flappy/flappy.dart';
import 'package:d2ystore/features/games/game_list.dart';
import 'package:d2ystore/features/games/snake/snake.dart';
import 'package:d2ystore/features/splash.dart';

import 'package:d2ystore/main.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyApp.routeName:
        return MaterialPageRoute(
            settings: const RouteSettings(name: MyApp.routeName),
            builder: (_) => const MyApp());
      case Splash.routeName:
        return MaterialPageRoute(
            settings: const RouteSettings(name: Splash.routeName),
            builder: (_) => const Splash());
      case Dashboard.routeName:
        return MaterialPageRoute(
            settings: const RouteSettings(name: Dashboard.routeName),
            builder: (_) => Dashboard());

      // Games
      case GameList.routeName:
        return MaterialPageRoute(
            settings: const RouteSettings(name: GameList.routeName),
            builder: (_) => const GameList());
      case Flappy.routeName:
        return MaterialPageRoute(
            settings: const RouteSettings(name: Flappy.routeName),
            builder: (_) => const Flappy());
      case Snake.routeName:
        return MaterialPageRoute(
            settings: const RouteSettings(name: Snake.routeName),
            builder: (_) => const Snake());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
