import 'dart:convert';

import 'package:flutter/foundation.dart';

class PlayNow {
  final String original_title,
      backdrop_path,
      original_language,
      preview,
      poster_path,
      release_date;
  var popularity, vote_average, id;
  final int vote_count;

  PlayNow({
    required this.original_title,
    required this.backdrop_path,
    required this.original_language,
    required this.preview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
    required this.vote_count,
    required this.id,
  });

  factory PlayNow.fromJson(Map<String, dynamic> json) {
    return PlayNow(
      original_title: json['original_title'],
      backdrop_path: json['backdrop_path'],
      original_language: json['original_language'],
      preview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
      id: json['id'],
    );
  }
}

class PlayTopRated {
  final String poster_path,
      release_date,
      original_title,
      overview,original_language;
  var vote_average,
      vote_count,
      popularity,
      id;

  PlayTopRated({
    required this.poster_path,
    required this.release_date,
    required this.original_title,
    required this.overview,
    required this.vote_average,
    required this.vote_count,
    required this.id,
    required this.popularity,
    required this.original_language,
  });
  factory PlayTopRated.fromJson(Map<String, dynamic> json) {
    return PlayTopRated(
      original_title: json['original_title'],
      original_language: json['original_language'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
      id: json['id'],
    );
  }
}

class UpComing {
  final String poster_path,
      release_date,
      original_title,
      overview,original_language;
  var vote_average,
      vote_count,
      popularity,
      id;

  UpComing({
    required this.poster_path,
    required this.release_date,
    required this.original_title,
    required this.overview,
    required this.vote_average,
    required this.vote_count,
    required this.id,
    required this.popularity,
    required this.original_language,
  });
  factory UpComing.fromJson(Map<String, dynamic> json) {
    return UpComing(
      original_title: json['original_title'],
      original_language: json['original_language'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
      id: json['id'],
    );
  }
}
