import 'package:flutter/material.dart';

class GamesModel {
  final String name;
  final String image;
  final String description;
  final Widget navigatingTo;
  const GamesModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.navigatingTo});
}
