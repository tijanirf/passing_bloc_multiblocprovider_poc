import 'package:flutter/material.dart';

class ListingScreen extends StatelessWidget {
  static const name = 'listingScreen';

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => ListingScreen(),
      settings: RouteSettings(name: name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Listing Screen',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
