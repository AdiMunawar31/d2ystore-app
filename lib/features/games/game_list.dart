import 'package:d2ystore/common/pallete.dart';
import 'package:d2ystore/data/games_data.dart';
import 'package:d2ystore/features/dashboard.dart';
import 'package:d2ystore/models/game_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GameList extends StatelessWidget {
  static const routeName = '/game-List';
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Game List'),
      // ),
      backgroundColor: Pallete.base,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildCustomAppBar(context),
              buildBannerCarousel(),
              const SizedBox(
                height: 16,
              ),
              buildGameList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacementNamed(context, Dashboard.routeName);
            },
            color: Colors.white, // Ganti warna sesuai kebutuhan
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Pallete.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  style: const TextStyle(
                      color: Colors.white), // Menentukan warna teks
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7)), // Warna hint
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search,
                        color: Colors.white), // Warna ikon prefix
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBannerCarousel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: CarouselSlider(
        items: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/banners/game_b1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/banners/game_b3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/banners/game_b4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: 170.0,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1500),
          viewportFraction: 0.8,
        ),
      ),
    );
  }

  // Widget buildGameList(BuildContext context) {
  //   return Expanded(
  //     child: GridView.count(
  //       childAspectRatio: 0.9,
  //       crossAxisCount: 3,
  //       mainAxisSpacing: 16,
  //       crossAxisSpacing: 8,
  //       children: games.map((data) {
  //         return buildGameListItem(context, data);
  //       }).toList(),
  //     ),
  //   );
  // }

  Widget buildGameList(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 3 / 4.3,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return buildGameListItem(context, games[index]);
        },
      ),
    );
  }

  Widget buildGameListItem(BuildContext context, GameItem game) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, game.routeName);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(game.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              game.name,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            RatingBar.builder(
              initialRating: game.rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 14.0,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Handle rating update
              },
            ),
          ],
        ),
      ),
    );
  }
}
