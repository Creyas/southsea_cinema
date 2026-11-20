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
  String _bookingMessage = '';

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
      color: cinemaBackground,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dracula",
                style: TextStyle(
                  color: Color.fromARGB(255, 252, 250, 250),
                  fontSize: 100
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "A decription of the film",
                style: TextStyle(color: Color.fromARGB(255, 252, 250, 250)),
              ),
              DropdownMenu<int>(
                initialSelection: _ticketQuantity,
                onSelected: (int? value) {
                  if (value != null) {
                    setState(() {
                      _ticketQuantity = value;
                    });
                    Text('Tickets selected: $_ticketQuantity');
                  }
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 1, label: '1'),
                  DropdownMenuEntry(value: 2, label: '2'),
                  DropdownMenuEntry(value: 3, label: '3'),
                  DropdownMenuEntry(value: 4, label: '4'),
                  DropdownMenuEntry(value: 5, label: '5'),
                ],
              ),
              Text('Tickets selected: $_ticketQuantity'),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bookingMessage =
                          'Added $_ticketQuantity tickets to order';
                    });
                  },
                  child: const Text('Add to order')),
              Text(_bookingMessage)
            ],
          )),
    );
  }
}
