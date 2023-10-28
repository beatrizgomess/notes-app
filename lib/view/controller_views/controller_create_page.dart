import 'package:flutter/material.dart';
import 'package:notes_app/controller/controller_notes.dart';

class ControllerCreatePage {
  TextEditingController titleEditinController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  var notesController = NotesController();
  final textNode = FocusNode();

  changeFocus(context) {
    if (textNode.hasPrimaryFocus ||
        MediaQuery.of(context).viewInsets.bottom > 0) {
      // Seta o foco para um focusNode fantasma,
      //tirando assim o foco do componente que deseja
      FocusScope.of(context).requestFocus(FocusNode());
      return false;
    } else {
      return true;
    }
  }
}
