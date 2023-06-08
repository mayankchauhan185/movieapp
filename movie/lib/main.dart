import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/description.dart';

import 'package:movie/widgets/ta.dart';
import 'package:movie/widgets/toprated.dart';
import 'package:movie/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.deepPurple),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List tv = [];
  List trendingmovies = [];
  List topratedmovies = [];

  final apikey = 'caa7b101b5d59cd6d872f8be735fe033';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYWE3YjEwMWI1ZDU5Y2Q2ZDg3MmY4YmU3MzVmZTAzMyIsInN1YiI6IjY0NzVjMTYxOTI0Y2U2MDExNmM2MmI2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sT9KZ8QH0IByd-J7ILR0p5YyroDU_TzvjOLwhjlW7N0';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    setState(() {
      tv = tvresult['results'];
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text('Movie App ❤️'),
        ),
        titleTextStyle: GoogleFonts.lato(color: Colors.white),
      ),
      body: ListView(
        children: [
          TopRatedMovies(
            toprated: topratedmovies,
          ),
          TrendingMovies(trending: trendingmovies),
          TV(tv: tv),
        ],
      ),
    );
  }
}
