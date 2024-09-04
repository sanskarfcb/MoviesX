import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieServices {
  Future<List<dynamic>> popularMovies() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzY2NjZmU2YWNmOTFkYTNmZTFlMzQ5YmFkM2I2ZDA2NSIsIm5iZiI6MTcyNTMwMTU3OC4xMDY5NDQsInN1YiI6IjY2ZDVkZDE3YTY5NjUwNzVkMGNiNzhhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2En_1Y0UfmJgKJqe7e077u0JbNxJKYckVdNomfFt_OY',
      'accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> UpcomingMovies() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzY2NjZmU2YWNmOTFkYTNmZTFlMzQ5YmFkM2I2ZDA2NSIsIm5iZiI6MTcyNTMwMTU3OC4xMDY5NDQsInN1YiI6IjY2ZDVkZDE3YTY5NjUwNzVkMGNiNzhhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2En_1Y0UfmJgKJqe7e077u0JbNxJKYckVdNomfFt_OY',
      'accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> topratedMovies() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzY2NjZmU2YWNmOTFkYTNmZTFlMzQ5YmFkM2I2ZDA2NSIsIm5iZiI6MTcyNTMwMTU3OC4xMDY5NDQsInN1YiI6IjY2ZDVkZDE3YTY5NjUwNzVkMGNiNzhhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2En_1Y0UfmJgKJqe7e077u0JbNxJKYckVdNomfFt_OY',
      'accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> SimilarMovies(int movieId) async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzY2NjZmU2YWNmOTFkYTNmZTFlMzQ5YmFkM2I2ZDA2NSIsIm5iZiI6MTcyNTMwMTU3OC4xMDY5NDQsInN1YiI6IjY2ZDVkZDE3YTY5NjUwNzVkMGNiNzhhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2En_1Y0UfmJgKJqe7e077u0JbNxJKYckVdNomfFt_OY',
      'accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/${movieId}/similar?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('error');
    }
  }
}
