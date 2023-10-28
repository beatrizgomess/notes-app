import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/component/alert_dialog_delete.dart';
import 'package:notes_app/component/card_note_components_style.dart';
import 'package:notes_app/controller/controller_notes.dart';
import 'package:notes_app/service/notes_service.dart';
import 'package:notes_app/view/notes_update.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  var notesController = NotesController();

  @override
  void initState() {
    notesController.getAllNotes();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NotesController>(context, listen: false).getAllNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<NotesController>(builder: (context, value, child) {
        final list = value.note;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return CardTodoListComponent(
              id: item.id!,
              title: item.title!,
              description: item.description!,
              createdAt: item.createdAt!,
              delete: () {
                showDialog(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return ShowDialogDelete(notes: item);
                    });
              },
              edit: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotesUpdatePage(
                            title: item.title!,
                            description: item.description!,
                            createdAt: item.createdAt!,
                            id: item.id!)));
              },
            );
          },
        );
      }),
    );
  }
}
