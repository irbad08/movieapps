import 'package:flutter/material.dart';
import 'package:movieapps/api/modelApi.dart';
import 'package:movieapps/api/restApi.dart';
import 'package:movieapps/komponen/button.dart';
import 'package:movieapps/komponen/color.dart';
import 'package:movieapps/page/drawer.dart';

class TopRated extends StatefulWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  final RestPlayTopRated playNow = RestPlayTopRated();
  List<PlayTopRated> playtopRate = [];

  getData() async {
    playtopRate = await playNow.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated"),
        backgroundColor: SigColors.primary,
      ),
      backgroundColor: SigColors.secondary,
      drawer: NavigationDrawer(),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ButtonFilm(
              original_title: playtopRate[index].original_title,
              original_language: playtopRate[index].original_language,
              release_date: playtopRate[index].release_date,
              // popularity: playtopRate[index].popularity.toString(),
              overview: playtopRate[index].overview,
              poster_path: playtopRate[index].poster_path,
              vote_average: playtopRate[index].vote_average,
              vote_count: playtopRate[index].vote_count,
            );
          },
          itemCount: playtopRate.length,
        ),
      ),
    );
  }
}
