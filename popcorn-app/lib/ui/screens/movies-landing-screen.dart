// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:project/utils/constants.dart' as constants;

class MoviesLandingScreen extends StatefulWidget {
  const MoviesLandingScreen({super.key});

  @override
  State<MoviesLandingScreen> createState() => _MoviesLandingScreenState();
}

class _MoviesLandingScreenState extends State<MoviesLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: _createLandingFullView(context));
  }

  Widget _createLandingFullView(BuildContext context) {
    return Column(
      children: const [
        TextView(
          text: constants.topRated,
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: MovieRow(),
        ),
        TextView(
          text: constants.newMovies,
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: MovieRow(),
        ),
        TextView(
          text: constants.popularMovies,
        ),
        SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: MovieRow())
      ],
    );
  }
}

class TextView extends StatelessWidget {
  final String text;
  const TextView({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 20),
      decoration: null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 00),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MovieRow extends StatelessWidget {
  const MovieRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            10,
            (index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      height: 200,
                      image: AssetImage('assets/images/seven.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                )));
  }
}
