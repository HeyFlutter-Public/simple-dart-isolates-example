import 'package:flutter/material.dart';
import 'package:simple_isolate/models/movie.dart';
import 'package:simple_isolate/widgets/movie_widget.dart';

class MoviesGridWidget extends StatelessWidget {
  const MoviesGridWidget({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
          childAspectRatio: 9 / 16,
        ),
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        primary: false,
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieWidget(movie: movies[index]),
      );
}
