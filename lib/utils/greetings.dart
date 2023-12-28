import 'package:flutter/material.dart';

String getGreeting() {
  var now = DateTime.now();

  if (now.hour < 12) {
    return 'Good Morning';
  } else if (now.hour < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}

Widget buildGreetingText() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      getGreeting(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
