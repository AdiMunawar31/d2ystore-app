import 'package:d2ystore/common/d2y_style.dart';
import 'package:d2ystore/common/pallete.dart';
import 'package:d2ystore/features/splash.dart';
import 'package:d2ystore/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Pallete.base));

  // WidgetsFlutterBinding.ensureInitialized();
  // await Flame.device.fullScreen();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const routeName = '/';

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    D2YStyle _style = D2YStyle();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D2YSTORE',
      theme: _style.lightTheme,
      home: const Splash(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
