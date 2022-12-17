import 'package:flutter/material.dart';


class DetailFilm extends StatefulWidget {
  const DetailFilm({ Key? key,required this.id }) : super(key: key);
  final id;

  @override
  State<DetailFilm> createState() => _DetailFilmState(id: id);
}

class _DetailFilmState extends State<DetailFilm> {
  final int id;

  _DetailFilmState({Key? key, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}