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
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            BackButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
            Container(height: double.infinity, color: Colors.black),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: constraints.maxHeight / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              constants.baseUrlBackImage + movie.posterPath!,
                            ))),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4 - 50,
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
              image: NetworkImage(
                constants.baseUrlBackImage + movie.posterPath!,
              ))),
    );
  }
  */
}
