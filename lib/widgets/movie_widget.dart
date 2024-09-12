import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_isolate/constants/routes.dart';
import 'package:simple_isolate/models/movie.dart';
import 'package:simple_isolate/widgets/loading_widget.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = Border.all(color: colors.onSurface, width: 3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              Routes.movieDetails,
              arguments: movie,
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
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
        ),
        const SizedBox(height: 12),
        Text(
          movie.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          'IMDB: ${movie.imdbRating!}',
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
