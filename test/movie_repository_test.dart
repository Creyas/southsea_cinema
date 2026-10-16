import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository', () {
    late MovieRepository repository;

    setUp(() {
      repository = MovieRepository();
    });

    test('returns a movie when the ID exists', () {
      final movie = repository.getMovieById('the-dark-knight');

      expect(movie, isNotNull);
      expect(movie!.id, 'the-dark-knight');
      expect(movie.title, 'The Dark Knight');
    });

    test('returns null when the ID does not exist', () {
      final movie = repository.getMovieById('missing-movie');

      expect(movie, isNull);
    });
  });
}