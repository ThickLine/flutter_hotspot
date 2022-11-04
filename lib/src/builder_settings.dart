import 'package:flutter/material.dart';

class BuilderSettings {
  final Color primaryColor;
  final String endText;
  final String previousText;
  final String doneText;
  final String nextText;

  BuilderSettings({
    this.primaryColor = Colors.blue,
    this.endText = 'End Tour',
    this.previousText = 'Previous',
    this.doneText = 'Done',
    this.nextText = 'Next',
  });
}
