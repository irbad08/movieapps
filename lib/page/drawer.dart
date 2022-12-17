import 'package:flutter/material.dart';
import 'package:movieapps/api/modelApi.dart';
import 'package:movieapps/api/restApi.dart';
import 'package:movieapps/komponen/color.dart';
import 'package:movieapps/main.dart';
import 'package:movieapps/page/nowplaying.dart';
import 'package:movieapps/page/toprated.dart';
import 'package:movieapps/page/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  // final RestApiPlaynow playNow = RestApiPlaynow();
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: SigColors.secondaryBackground,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              header(context),
              menu(context),
            ],
          ),
        ),
      );

  Widget header(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget menu(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 14,
          children: [
            ListTile(
              textColor: SigColors.white,
              iconColor: SigColors.white,
              leading: const Icon(Icons.home_outlined),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHome(title: "Home"),
                  ),
                );
              },
            ),
            ListTile(
              textColor: SigColors.white,
              iconColor: SigColors.white,
              leading: const Icon(Icons.play_arrow_outlined),
              title: Text("Now Playing"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NowPlaying(),
                  ),
                );
              },
            ),
            ListTile(
              textColor: SigColors.white,
              iconColor: SigColors.white,
              leading: const Icon(Icons.trending_up_outlined),
              title: Text("Top Rated"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const TopRated()),
                );
              },
            ),
            ListTile(
              textColor: SigColors.white,
              iconColor: SigColors.white,
              leading: const Icon(Icons.tv_sharp),
              title: Text("Upcoming"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Upcoming(),
                  ),
                );
              },
            )
          ],
        ),
      );
}
