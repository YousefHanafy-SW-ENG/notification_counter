import 'package:flutter/material.dart';

LinearGradient buildGradient(List<Color> colors, {
  Alignment begin = Alignment.topLeft,
  Alignment end = Alignment.bottomRight,
}) {
  return LinearGradient(
    colors: colors,
    begin: begin,
    end: end,
  );
}
