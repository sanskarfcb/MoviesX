import 'package:flutter/material.dart';
import 'package:moviesapp/screens/movies_detail.dart';

class FilteredMoviesList extends StatelessWidget {
  List<dynamic> movies;
  FilteredMoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoviesDetail(
                            movie: movie,
                          )));
            },
            leading: Image.network(
              'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(movie['title']),
            subtitle: Text(movie['overview']),
          );
        });
  }
}
