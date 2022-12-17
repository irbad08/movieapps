import 'package:flutter/material.dart';
import 'package:movieapps/api/modelApi.dart';
import 'package:movieapps/api/restApi.dart';
import 'package:movieapps/komponen/button.dart';
import 'package:movieapps/komponen/color.dart';
import 'package:movieapps/page/drawer.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  final RestApiPlaynow playNow = RestApiPlaynow();
  List<PlayNow> playnow = [];

  getData() async {
    playnow = await playNow.getData();
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
    // getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        backgroundColor: SigColors.primary,
      ),
      backgroundColor: SigColors.secondary,
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ButtonFilm(
            original_title: playnow[index].original_title,
            original_language: playnow[index].original_language,
            release_date: playnow[index].release_date,
            overview: playnow[index].preview,
            poster_path: playnow[index].poster_path,
            vote_average: playnow[index].vote_average,
            vote_count: playnow[index].vote_count,
          );
        },
        itemCount: playnow.length,
      ),
    );
  }
}
