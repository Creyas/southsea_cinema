import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'the-dark-knight',
        title: 'The Dark Knight',
        synopsis: '''
When the Joker wreaks havoc on Gotham, Batman, James Gordon and Harvey Dent work together to stop him. Set within a year after the events of Batman Begins (2005), Batman, Lieutenant James Gordon, and new District Attorney Harvey Dent successfully begin to round up the criminals that plague Gotham City, until a mysterious and sadistic criminal mastermind known only as "The Joker" appears in Gotham, creating a new wave of chaos. Batman's struggle against The Joker becomes deeply personal, forcing him to confront everything he believes and improve his technology to stop him. A love triangle develops between Bruce Wayne, Dent, and Rachel Dawes.
''',
        ageRating: 'PG-13',
        runtime: '2h 32m',
        screeningTime: '18:30',
        ticketPrice: 8.50,
        posterImagePath: 'assets/images/the_dark_knight.jpg',
      ),
      Movie(
        id: 'Chainsaw Man - The Movie: Reze Arc',
        title: 'Chainsaw Man - The Movie: Reze Arc',
        synopsis:
            'For the first time, Chainsaw Man slashes his way onto the big screen in an epic, action-fueled adventure that continues the hugely popular anime series. Denji worked as a Devil Hunter for the yakuza, trying to pay off the debt he inherited from his parents, until the yakuza betrayed him and had him killed. As he was losing consciousness, Denji’s beloved chainsaw-powered devil-dog, Pochita, made a deal with Denji and saved his life. This fused the two together, creating the unstoppable Chainsaw Man. Now, in a brutal war between devils, hunters, and secret enemies, a mysterious girl named Reze has stepped into his world, and Denji faces his deadliest battle yet, fueled by love in a world where survival knows no rules.',
        ageRating: '15',
        runtime: '1h 40m',
        screeningTime: '21:00',
        ticketPrice: 8.50,
        posterImagePath: 'assets/images/chainsaw_man_reze_arc.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }

    return null;
  }
}
