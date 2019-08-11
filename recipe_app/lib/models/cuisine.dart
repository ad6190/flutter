import 'package:flutter/material.dart';

class Cuisine {
  final String id;
  final String title;
  final Color color;

  const Cuisine({
    @required this.id,
    @required this.title,
    this.color = Colors.black,
  });
}
