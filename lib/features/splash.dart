import 'package:d2ystore/common/pallete.dart';
import 'package:d2ystore/features/dashboard.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    // Tambahkan delay selama 2 detik untuk menampilkan splash screen
    await Future.delayed(const Duration(seconds: 3));
    // Pindah ke home screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => Dashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.base,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tambahkan logo atau gambar splash screen
            Image.asset(
              'assets/images/d2ystore.png', // Ganti dengan path gambar/logo Anda
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            // Tambahkan teks atau animasi lainnya
            const Text(
              'D2YSTORE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
