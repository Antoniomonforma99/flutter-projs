import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/model/movide_detail_response.dart';
import 'package:project/utils/constants.dart' as constants;

class HeaderAndRating extends StatelessWidget {
  final Size size;
  final MovieDetail movie;

  const HeaderAndRating({super.key, required this.size, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4 - 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  constants.baseUrlBackImage + movie.posterPath!))),
    );
  }
}
