import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model', () {
    test('assigns constructor properties correctly', () {
      const movie = Movie(
        id: 'the-dark-knight',
        title: 'The Dark Knight',
        synopsis: 'Batman faces the Joker in Gotham City.',
        ageRating: 'PG-13',
        runtime: '2h 32m',
        screeningTime: '18:30',
        ticketPrice: 8.50,
        posterImagePath: 'assets/images/the_dark_knight.jpg',
      );

      expect(movie.id, 'the-dark-knight');
      expect(movie.title, 'The Dark Knight');
      expect(movie.synopsis, 'Batman faces the Joker in Gotham City.');
      expect(movie.ageRating, 'PG-13');
      expect(movie.runtime, '2h 32m');
      expect(movie.screeningTime, '18:30');
      expect(movie.ticketPrice, 8.50);
      expect(movie.posterImagePath, 'assets/images/the_dark_knight.jpg');
    });

    test('formats a whole-pound price with two decimal places', () {
      const movie = Movie(
        id: 'whole-pound-film',
        title: 'Whole Pound Film',
        synopsis: 'A test synopsis.',
        ageRating: '12A',
        runtime: '1h 30m',
        screeningTime: '18:00',
        ticketPrice: 8,
        posterImagePath: 'assets/images/test.jpg',
      );

      expect(movie.formattedPrice, '£8.00');
    });

    test('formats a price with pence with two decimal places', () {
      const movie = Movie(
        id: 'pence-film',
        title: 'Pence Film',
        synopsis: 'A test synopsis.',
        ageRating: 'PG',
        runtime: '1h 45m',
        screeningTime: '20:00',
        ticketPrice: 8.50,
        posterImagePath: 'assets/images/test.jpg',
      );

      expect(movie.formattedPrice, '£8.50');
    });
  });
}