import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const name = 'splashScreen';

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => SplashScreen(),
      settings: RouteSettings(name: name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
