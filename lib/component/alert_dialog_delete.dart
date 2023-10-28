import 'package:flutter/material.dart';
import 'package:notes_app/controller/controller_notes.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/service/notes_service.dart';
import 'package:notes_app/view/notes_principal_page.dart';

class ShowDialogDelete extends StatefulWidget {
  ShowDialogDelete({super.key, required this.notes});
  var notes = Notes();
  @override
  State<ShowDialogDelete> createState() => _ShowDialogDeleteState();
}

class _ShowDialogDeleteState extends State<ShowDialogDelete> {
  var notesController = NotesController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure you want to delete it?'),
      actions: <Widget>[
        TextButton(
          child: const Text('Confirm'),
          onPressed: () async {
            await notesController.removeNotes(widget.notes);
            notesController.load();
            notesController.navigatorNotesPage(context);
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            notesController.load();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
