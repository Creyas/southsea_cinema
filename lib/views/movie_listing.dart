import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'The Dark Knight',
              style: TextStyle(fontSize: 40),
            ),
            const Text(
              '2008 | PG-13 | 2h 32m',
              style: TextStyle(fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.',
                style: TextStyle(fontSize: 12),
              ),
            ),
            DropdownMenu<int>(
              initialSelection: _ticketQuantity,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                  print('Tickets selected: $_ticketQuantity');
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
