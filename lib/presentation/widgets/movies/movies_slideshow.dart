import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:info_movies/domain/entities/movie.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideShow({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.25,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: movies.length,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(
            top: 0,
          ),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
        itemBuilder: (context, index) => _Slide(movie: movies[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.03,
      ),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                );
              }
              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}
