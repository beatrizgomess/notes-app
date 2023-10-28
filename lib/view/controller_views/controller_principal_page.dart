import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/controller/controller_notes.dart';
import 'package:notes_app/themes/app_style.dart';

class ControllerPrincipalPage {
  var notesController = NotesController();
  getInfo() {
    getinfo() async {
      await notesController.getAllNotes();
    }
  }

  Color generateRandomColor(Random _random) {
    return AppStyle.cardsColor[_random.nextInt(AppStyle.cardsColor.length)];
  }
}
