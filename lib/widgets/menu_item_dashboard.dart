import 'package:d2ystore/common/pallete.dart';
import 'package:d2ystore/models/dashboard_items.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final DashboardItems data;

  const MenuItem(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.pushNamed(context, data.routeName);
      }),
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              data.img,
              width: 50,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              data.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              data.event,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
