import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:info_movies/presentation/providers/providers.dart';
import 'package:info_movies/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final dateDay = DateTime.now();
    final dateNameDay = DateFormat('EEE, MMM').format(dateDay);

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final size = MediaQuery.of(context).size;
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
            titlePadding: EdgeInsets.zero,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  MoviesSlideShow(movies: slideShowMovies),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  MovieHorizontalListView(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: '${dateDay.day} $dateNameDay',
                    loadNextPage: () {
                      ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .loadNextPage();
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  MovieHorizontalListView(
                    movies: topRatedMovies,
                    title: 'Próximamente',
                    subTitle: 'Este mes',
                    loadNextPage: () {
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  MovieHorizontalListView(
                    movies: popularMovies,
                    title: 'Populares',
                    // subTitle: 'Este mes',
                    loadNextPage: () {
                      ref.read(popularMoviesProvider.notifier).loadNextPage();
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  MovieHorizontalListView(
                    movies: upcomingMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage: () {
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
