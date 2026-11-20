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
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chainsaw Man: Reze Arc",
                style: TextStyle(
                    color: Color.fromARGB(255, 252, 250, 250), fontSize: 50),
                textAlign: TextAlign.left,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                "For the first time, Chainsaw Man slashes his way onto the big screen in an epic, action-fueled adventure that continues the hugely popular anime series. Denji worked as a Devil Hunter for the yakuza, trying to pay off the debt he inherited from his parents, until the yakuza betrayed him and had him killed. As he was losing consciousness, Denji’s beloved chainsaw-powered devil-dog, Pochita, made a deal with Denji and saved his life. This fused the two together, creating the unstoppable Chainsaw Man. Now, in a brutal war between devils, hunters, and secret enemies, a mysterious girl named Reze has stepped into his world, and Denji faces his deadliest battle yet, fueled by love in a world where survival knows no rules.",
                style: TextStyle(color: Color.fromARGB(255, 252, 250, 250)),
              ),
              ),
              const SizedBox(height: 24.0,),
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
              const SizedBox(height: 12.0,),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bookingMessage =
                          'Added $_ticketQuantity tickets to order';
                    });
                  },
                  child: const Text('Add to order')),
                  const SizedBox(height: 12.0,),
              Text(_bookingMessage)
            ],
          )),
    );
  }
}
