import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/controller/controller_notes.dart';
import 'package:notes_app/themes/app_style.dart';
import 'package:notes_app/view/controller_views/controller_update_page.dart';
import 'package:notes_app/view/notes_principal_page.dart';

class NotesUpdatePage extends StatefulWidget {
  NotesUpdatePage(
      {super.key,
      required this.title,
      required this.id,
      required this.description,
      required this.createdAt});
  String title;
  String description;
  String createdAt;
  String? done;
  int id;
  var notesProvider = NotesController();
  @override
  State<NotesUpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<NotesUpdatePage> {
  var _controllerUpdatePage = ControllerUpdatePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.background,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            widget.notesProvider.updateNotes(Notes(
                title: widget.title,
                description: widget.description,
                id: widget.id));
            _controllerUpdatePage.notesController.navigatorNotesPage(context);
          },
          icon: const Icon(Icons.edit),
          label: const Text("Edit")),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStyle.background,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title: ",
                        style: AppStyle.mainTitle,
                      ),
                      TextFormField(
                        maxLines: 2,
                        maxLength: 50,
                        onChanged: (value) {
                          widget.title = value;
                        },
                        controller: TextEditingController(text: widget.title),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        cursorHeight: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description:",
                        style: AppStyle.mainTitle,
                      ),
                      TextFormField(
                        maxLines: 5,
                        maxLength: 200,
                        onChanged: (value) {
                          widget.description = value;
                        },
                        controller:
                            TextEditingController(text: widget.description),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        cursorHeight: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
