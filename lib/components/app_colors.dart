import 'package:flutter/material.dart';

class AppColors {
  //  цвета текста иконки

  static const Color white = Color(0xFFFFFFFF);
  static const Color primaryGray = Color(0xFFEBEBEB);
  static const Color gray = Color(0xFF939393);
  static const Color primaryBlack = Color(0xFF131313);
  static const Color blue = Color(0xFF00584FE);
  static const Color red = Colors.red;
  static const Color greyText = Color(0xFF939393);

  // Фоновые цвета
  static const Color backgroundLevel1 = Color(0xFF080B0D);
  static const Color backgroundLevel2 = Color(0xFF191F24);
  static const Color backgroundLevel3 = Color(0xFF3D3D3D);
  static const Color backgroundLevel4 = Color(0xFF262E36);

  // основные цвета
  static const Color accentGreen = Color(0xFF538851);
  static const Color accentRed = Color(0xFFAB3F3F);

  // градиенты
  static const LinearGradient blueGradient = LinearGradient(
    colors: [Color(0xFF4FACFE), Color(0xFF4FACFE)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient orangGradient = LinearGradient(
    colors: [Color(0xFFF6D365), Color(0xFFFDA085)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient lightRoseGradient = LinearGradient(
    colors: [Color(0xFFF093FB), Color(0xFFF5576C)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF43E97B), Color(0xFF38F9D7)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
