import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF419149F);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.teal,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  int selectedColor = 0;
  AppTheme(this.selectedColor)
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            "Color must be between 0 and ${_colorThemes.length}");

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
