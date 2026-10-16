import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: const Column(
          children: [
           Text('The Dark Knight', style: TextStyle(fontSize: 40)),
           Text('2008 | PG-13 | 2h 32m', style: TextStyle(fontSize: 16)),
           Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),

    );
  }
}
