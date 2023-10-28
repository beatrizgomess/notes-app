import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/themes/app_style.dart';

class ControllerCardNoteComponent {
  Color generateRandomColor(Random _random) {
    return AppStyle.cardsColor[_random.nextInt(AppStyle.cardsColor.length)];
  }
}
