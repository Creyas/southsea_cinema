import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final MovieRepository _movieRepository = MovieRepository();

  @override
  Widget build(BuildContext context) {
    final movies = _movieRepository.getMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MovieCard(
              movie: movie,
              onBookPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieListing(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
