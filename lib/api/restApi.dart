import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapps/api/modelApi.dart';
import 'package:tmdb_api/tmdb_api.dart';

// import 'package:location/location.dart';
// class RestApiPlaynow {
//   final String _apikey = 'c7712c327f75e0086a5fd8435e09aab3';
//   final assestoken =
//       'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNzcxMmMzMjdmNzVlMDA4NmE1ZmQ4NDM1ZTA5YWFiMyIsInN1YiI6IjYzOTMyYjUzYmE0ODAyMDBiYjAxMGZmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.20cF2N2S7q13VRUS5cg917BWCQFzHXCMjjUPe_uuThQ';
//   TMDB url = TMDB(
//     ApiKeys('c7712c327f75e0086a5fd8435e09aab3', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNzcxMmMzMjdmNzVlMDA4NmE1ZmQ4NDM1ZTA5YWFiMyIsInN1YiI6IjYzOTMyYjUzYmE0ODAyMDBiYjAxMGZmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.20cF2N2S7q13VRUS5cg917BWCQFzHXCMjjUPe_uuThQ',),
//     logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true),
//   );
//   Future getData() async{
//     Map respone = await url.v3.trending.getTrending();
//     print(respone);
//   }
// }
class RestApiPlaynow {
  final _baseUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=c7712c327f75e0086a5fd8435e09aab3&language=en-US&';
  final _page = 'page=1';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + _page));
      if (response.statusCode == 200) {
        Iterable iterable = jsonDecode(response.body)['results'];
        List<PlayNow> listFilm = iterable
            .map((e) => PlayNow.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        // print(iterable);
        return listFilm;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class RestPlayTopRated {
  final _baseUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=c7712c327f75e0086a5fd8435e09aab3&language=en-US';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable iterable = jsonDecode(response.body)['results'];
        List<PlayTopRated> listFilm = iterable
            .map((e) => PlayTopRated.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        // print(iterable);
        return listFilm;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class RestUpComing{
  final _baseUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=c7712c327f75e0086a5fd8435e09aab3&language=en-US';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable iterable = jsonDecode(response.body)['results'];
        List<UpComing> listFilm = iterable
            .map((e) => UpComing.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        // print(iterable);
        return listFilm;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
