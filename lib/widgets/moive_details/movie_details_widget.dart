import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/moive_details/movie_detalis_cast_widget.dart';
import 'package:themoviedb/widgets/moive_details/movie_detalis_main_info.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;

  const MovieDetailsWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tom Clancy'),
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: const [
            MovieDetMainInfo(),
            SizedBox(height: 10),
            MovieDetCastWidget(),
          ],
        ),
      ),
    );
  }
}
