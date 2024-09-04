import 'package:flutter/material.dart';

class HorizontalViewScroll extends StatelessWidget {
  final List<dynamic> movies;
  const HorizontalViewScroll({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(movies.length, (index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              // Handle tap
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Image.network(
                    'http://image.tmdb.org/t/p/w200${movie['poster_path']}',
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Text(movie['title']),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
