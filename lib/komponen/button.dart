import 'package:flutter/material.dart';
import 'package:movieapps/komponen/color.dart';

class ButtonFilm extends StatelessWidget {
  // variabel
  final String original_title,
      original_language,
      overview,
      release_date,
      // popularity,
      poster_path;
  var popularity, vote_average;
  final int vote_count;
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    alignment: Alignment.center,
    elevation: 2.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
  );

  ButtonFilm({
    required this.original_title,
    required this.original_language,
    required this.release_date,
    required this.overview,
    required this.poster_path,
    required this.vote_average,
    required this.vote_count,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: SigColors.shadowprimary,
      ),
      margin: const EdgeInsets.only(right: 8, left: 8, bottom: 10, top: 8),
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // const Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  original_title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: SigColors.white),
                ),
                Divider(),
                Text(
                  "Rating : " + vote_average.toString(),
                  style: const TextStyle(fontSize: 14, color: SigColors.white),
                ),
                Text(
                  "Realease Date : " + release_date,
                  style: const TextStyle(fontSize: 14, color: SigColors.white),
                ),
                Divider(),
                const Text(
                  "Sinopsis",
                  style: TextStyle(
                    fontSize: 18,
                    color: SigColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  overview,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: SigColors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).padding.right,
                left: MediaQuery.of(context).padding.left,
                top: MediaQuery.of(context).padding.top,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.40,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      image: NetworkImage(
                          ('https://image.tmdb.org/t/p/w500' + poster_path)),
                      fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}
