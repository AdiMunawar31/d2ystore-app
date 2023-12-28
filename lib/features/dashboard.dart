import 'package:d2ystore/common/pallete.dart';
import 'package:d2ystore/features/app/app_list.dart';
import 'package:d2ystore/features/games/game_list.dart';
import 'package:d2ystore/features/splash.dart';
import 'package:d2ystore/models/dashboard_items.dart';
import 'package:d2ystore/utils/greetings.dart';
import 'package:d2ystore/widgets/menu_item_dashboard.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard';

  final DashboardItems item1 = DashboardItems(
      img: "assets/images/app.png",
      title: "Application",
      event: "4 Apps",
      routeName: AppList.routeName);

  final DashboardItems item2 = DashboardItems(
      img: "assets/images/games.png",
      title: "Games",
      event: "4 Games",
      routeName: GameList.routeName);

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DashboardItems> myList = [item1, item2];
    return Scaffold(
      backgroundColor: Pallete.base,
      body: SafeArea(
        child: Column(
          children: [
            buildGreetingText(),
            const SizedBox(
              height: 60,
            ),
            Flexible(
              child: GridView.count(
                childAspectRatio: 1.0,
                padding: const EdgeInsets.only(left: 16, right: 16),
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                children: myList.map((data) {
                  return MenuItem(data);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
