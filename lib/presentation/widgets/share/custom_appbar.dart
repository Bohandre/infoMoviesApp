import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_movies/domain/entities/movie.dart';
import 'package:info_movies/presentation/delegates/search_movie_delegate.dart';
import 'package:info_movies/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_creation_outlined,
                color: colors.primary,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(
                'InfoMovies',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final searchedMovies = ref.read(searchedMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      initialMovies: searchedMovies,
                      searchMovies: ref
                          .read(searchedMoviesProvider.notifier)
                          .searchMoviesByQuery,
                    ),
                  ).then((movie) {
                    if (movie == null) return;
                    context.push('/movie/${movie.id}');
                  });
                },
                icon: const Icon(
                  Icons.search,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
