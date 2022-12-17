import 'package:flutter/material.dart';
import 'package:movieapps/api/modelApi.dart';
import 'package:movieapps/api/restApi.dart';
import 'package:movieapps/komponen/button.dart';
import 'package:movieapps/komponen/color.dart';
import 'package:movieapps/page/drawer.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final RestUpComing _upComing = RestUpComing();
  List<UpComing> upcoming = [];

  getUpcoming() async {
    upcoming = await _upComing.getData();
    setState(() {});
  }

  // construktor
  @override
  void initState() {
    getUpcoming();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming"),
        backgroundColor: SigColors.primary,
      ),
      backgroundColor: SigColors.secondary,
      drawer: NavigationDrawer(),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ButtonFilm(
              original_title: upcoming[index].original_title,
              original_language: upcoming[index].original_language,
              release_date: upcoming[index].release_date,
              // popularity: upcoming[index].popularity.toString(),
              overview: upcoming[index].overview,
              poster_path: upcoming[index].poster_path,
              vote_average: upcoming[index].vote_average,
              vote_count: upcoming[index].vote_count,
            );
          },
          itemCount: upcoming.length,
        ),
      ),
    );
  }
}
