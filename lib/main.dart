import 'package:flutter/material.dart';
import 'package:movieapps/api/modelApi.dart';
import 'package:movieapps/api/restApi.dart';
import 'package:movieapps/komponen/color.dart';
import 'package:movieapps/page/nowplaying.dart';
import 'package:movieapps/page/toprated.dart';
import 'package:movieapps/page/upcoming.dart';

import 'page/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Buy Movie',
      home: MyHome(title: 'Home'),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // variabel model
  final RestApiPlaynow playNow = RestApiPlaynow();
  final RestPlayTopRated playRated = RestPlayTopRated();
  final RestUpComing _upComing = RestUpComing();
  List<PlayNow> playnow = [];
  List<PlayTopRated> playrated = [];
  List<UpComing> upcoming = [];

  // funsgi panggil data
  getPlaynow() async {
    playnow = await playNow.getData();
    setState(() {});
  }

  getPlayrated() async {
    playrated = await playRated.getData();
    setState(() {});
  }

  getUpcoming() async {
    upcoming = await _upComing.getData();
    setState(() {});
  }

  // construktor
  @override
  void initState() {
    getPlaynow();
    getPlayrated();
    getUpcoming();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: SigColors.primary,
      ),
      backgroundColor: SigColors.secondary,
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Now Playing",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: SigColors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NowPlaying(),
                      ),
                    );
                  },
                  child: const Text(
                    "View More",
                    style: TextStyle(
                      fontSize: 16,
                      color: SigColors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 350,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: playnow.length,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    color: SigColors.secondaryBackground,
                    child: InkWell(
                      splashColor: SigColors.black,
                      onTap: () {},
                      child: Column(
                        children: [
                          Image(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              ('https://image.tmdb.org/t/p/w500' +
                                  playnow[index].poster_path),
                            ),
                            width: 200,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 200,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      playnow[index].original_title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: SigColors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      playnow[index].release_date,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: SigColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(right: 10));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Top Rated",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: SigColors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TopRated(),
                      ),
                    );
                  },
                  child: const Text(
                    "View More",
                    style: TextStyle(
                      fontSize: 14,
                      color: SigColors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: playrated.length,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    color: SigColors.secondaryBackground,
                    child: InkWell(
                      splashColor: SigColors.black,
                      onTap: () {},
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  playrated[index].poster_path,
                            ),
                            width: 100,
                          ),
                          SizedBox(
                            width: 100,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    playrated[index].original_title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: SigColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    playrated[index].release_date,
                                    style: const TextStyle(
                                        color: SigColors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(right: 10));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Upcoming",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: SigColors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Upcoming(),
                      ),
                    );
                  },
                  child: const Text(
                    "View More",
                    style: TextStyle(
                      fontSize: 14,
                      color: SigColors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: upcoming.length,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    child: InkWell(
                      splashColor: SigColors.black,
                      onTap: (){},
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  upcoming[index].poster_path,
                            ),
                            width: 100,
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  upcoming[index].original_title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: SigColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  upcoming[index].release_date,
                                  style: const TextStyle(
                                      color: SigColors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: SigColors.secondaryBackground,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(right: 15));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
