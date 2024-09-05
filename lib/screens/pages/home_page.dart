import 'package:flutter/material.dart';
import 'package:moviesapp/screens/services/movie_services.dart';
import 'package:moviesapp/screens/widgets/filtered_movies_list.dart';
import 'package:moviesapp/screens/widgets/horizontal_view_scroll.dart';
import 'package:moviesapp/screens/widgets/movie_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> popularMovies = [];
  List<dynamic> topRatedMovies = [];
  List<dynamic> upcomingMovies = [];
  List<dynamic> filteredMovies = [];
  bool _isSearchEmpty = true;
  bool _isLoading = true;

  void filterMovies(String query) {
    setState(() {
      filteredMovies = popularMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          topRatedMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          upcomingMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList();
      _isSearchEmpty = query.isEmpty;
    });
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: TextField(
        onChanged: (value) {
          filterMovies(value);
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Movies',
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  fetchMovies() async {
    MovieServices movieServices = MovieServices();
    popularMovies = await movieServices.popularMovies();
    topRatedMovies = await movieServices.topratedMovies();
    upcomingMovies = await movieServices.UpcomingMovies();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              searchBar(),
              const SizedBox(height: 20),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : !_isSearchEmpty && filteredMovies.isEmpty
                      ? const Center(child: Text('No movies found'))
                      : _isSearchEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Top Rated Movies',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                MovieSlider(topRatedMovies: topRatedMovies),
                                const SizedBox(height: 30),
                                const Text(
                                  'Popular Movies',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                HorizontalViewScroll(movies: popularMovies),
                                const SizedBox(height: 30),
                                const Text(
                                  'Upcoming Movies',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                HorizontalViewScroll(movies: upcomingMovies),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'Filtered Movies',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FilteredMoviesList(movies: filteredMovies),
                              ],
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
