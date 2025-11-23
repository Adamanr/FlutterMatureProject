import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient primaryLight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFA1CAFF), Color(0xFF409CFF), Color(0xFFA1CAFF)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient mint = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF74C8E4), Color(0xFF73D5BC), Color(0xFF74C8E4)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient blueDeep = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF6289F0), // 5%
      Color(0xFF3740F5), // 65%
      Color(0xFF2254F5), // 65%
      Color(0xFF3740F5), // 65%
      Color(0xFF6289F0), // 5%
    ],
    stops: [0.05, 0.35, 0.65, 0.85, 0.95],
  );
}
