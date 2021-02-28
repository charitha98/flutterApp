library values;

import 'dart:ui';
import 'package:flutter/rendering.dart';

class AppColors {
  static const Color primaryBackground = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryBackground = Color.fromARGB(255, 226, 240, 255);
  static const Color ternaryBackground = Color.fromARGB(255, 228, 226, 255);
  static const Color primaryElement = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryElement = Color.fromARGB(255, 241, 249, 255);
  static const Color accentElement = Color.fromARGB(255, 180, 180, 180);
  static const Color primaryText = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryText = Color.fromARGB(255, 71, 71, 71);
  static const Color accentText = Color.fromARGB(255, 38, 153, 251);
}

class Radii {
  static const BorderRadiusGeometry k1pxRadius =
      BorderRadius.all(Radius.circular(1));
}

class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(10, 0, 0, 0),
    offset: Offset(0, 3),
    blurRadius: 10,
  );
  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color.fromARGB(112, 0, 0, 0),
    offset: Offset(0, 3),
    blurRadius: 10,
  );
}

class Borders {
  static const BorderSide primaryBorder = BorderSide(
    color: Color.fromARGB(255, 226, 226, 226),
    width: 0.6,
    style: BorderStyle.solid,
  );
  static const BorderSide secondaryBorder = BorderSide(
    color: Color.fromARGB(255, 221, 221, 221),
    width: 0.5,
    style: BorderStyle.solid,
  );
}
