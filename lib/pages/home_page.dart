import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_isolate/models/movie.dart';
import 'package:simple_isolate/widgets/loading_widget.dart';
import 'package:simple_isolate/widgets/movies_grid_widget.dart';

const String moviesJsonFileName = 'assets/movies.json';

Future<List<Movie>> parseMovies(String jsonString) async {
  final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
  final moviesJson = jsonData['movies'] as List<dynamic>;
  final parsedMovies = moviesJson.map((json) => Movie.fromJson(json)).toList();
  for (int i = 0; i < 20000; i++) {
    log('Getting the movies...');
  }
  return parsedMovies;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];
  bool loading = false;

  Future<void> loadMoviesWithoutIsolate() async {
    setState(() => loading = true);
    final jsonString = await rootBundle.loadString(moviesJsonFileName);
    final parsedMovies = await parseMovies(jsonString);
    setState(() {
      loading = false;
      movies = parsedMovies;
    });
  }

  Future<void> loadMoviesWithIsolate() async {
    setState(() => loading = true);
    final jsonString = await rootBundle.loadString(moviesJsonFileName);
    final parsedMovies = await compute(parseMovies, jsonString);
    setState(() {
      loading = false;
      movies = parsedMovies;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Simple Isolate'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: FilledButton.styleFrom(foregroundColor: Colors.red),
                    onPressed: loading ? null : loadMoviesWithoutIsolate,
                    child: const Text('Load without Isolate'),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: loading ? null : loadMoviesWithIsolate,
                    child: const Text('Load with Isolate'),
                  )
                ],
              ),
            ),
          ),
        ),
        body: loading
            ? const Center(child: LoadingWidget())
            : MoviesGridWidget(movies: movies),
      );
}
