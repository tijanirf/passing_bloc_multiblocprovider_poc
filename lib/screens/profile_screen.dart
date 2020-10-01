import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const name = 'profileScreen';

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => ProfileScreen(),
      settings: RouteSettings(name: name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
