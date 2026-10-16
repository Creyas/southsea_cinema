import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onBookPressed;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              movie.posterImagePath,
              width: 110,
              height: 165,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${movie.ageRating} | ${movie.runtime}',
                    style: const TextStyle(color: cinemaFontMuted),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Screening: ${movie.screeningTime}',
                    style: const TextStyle(color: cinemaFontWhite),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.synopsis,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: cinemaFontWhite),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '£${movie.ticketPrice.toStringAsFixed(2)}',
                    style: const TextStyle(color: cinemaBrand),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      print('Booking ${movie.title}');
                      onBookPressed();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('Book'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
