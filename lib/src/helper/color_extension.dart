import 'package:flutter/material.dart';

extension ColorLuminance on Color {
  Color get cv {
    return this.computeLuminance() >= 0.7 ? Colors.black : Colors.white;
  }
}
