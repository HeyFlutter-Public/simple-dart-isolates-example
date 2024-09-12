import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_isolate/models/movie.dart';
import 'package:simple_isolate/widgets/details_item.dart';
import 'package:simple_isolate/widgets/loading_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;

    final colors = Theme.of(context).colorScheme;
    final border = Border.all(color: colors.onSurface, width: 3);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.25,
              width: width,
              child: AspectRatio(
                aspectRatio: 9 / 14,
                child: CachedNetworkImage(
                  imageUrl: movie.posterUrl!,
                  imageBuilder: (context, image) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: image, fit: BoxFit.cover),
                      border: border,
                    ),
                  ),
                  progressIndicatorBuilder: (_, url, progress) => DecoratedBox(
                    decoration: BoxDecoration(border: border),
                    child: const LoadingWidget(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(border: border),
                    child: const Icon(Icons.image),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              movie.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(
              movie.released!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 20),
            DetailsItem(title: 'IMDB', content: movie.imdbRating!),
            const SizedBox(height: 20),
            DetailsItem(title: 'Plot', content: movie.plot!),
            const SizedBox(height: 20),
            DetailsItem(title: 'Genre', content: movie.genre!),
            const SizedBox(height: 20),
            DetailsItem(title: 'Duration', content: movie.runtime!),
            const SizedBox(height: 20),
            DetailsItem(title: 'Director', content: movie.director!),
            const SizedBox(height: 20),
            DetailsItem(title: 'Writer', content: movie.writer!),
            const SizedBox(height: 20),
            DetailsItem(title: 'Actors', content: movie.actors!),
            const SizedBox(height: 20),
            DetailsItem(title: 'Country', content: movie.country!),
            const SizedBox(height: 20),
            DetailsItem(title: 'Language', content: movie.language!),
          ],
        ),
      ),
    );
  }
}
