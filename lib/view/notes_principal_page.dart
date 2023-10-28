import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/component/notes_list.dart';
import 'package:notes_app/controller/controller_notes.dart';
import 'package:notes_app/service/notes_service.dart';
import 'package:notes_app/themes/app_style.dart';
import 'package:notes_app/view/controller_views/controller_principal_page.dart';
import 'package:notes_app/view/notes_create_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesPage> {
  final _controllerPrincpalPage = ControllerPrincipalPage();
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controllerPrincpalPage.getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("New Notes"),
        icon: const Icon(Icons.add),

        backgroundColor:
            _controllerPrincpalPage.generateRandomColor(_random), //<-- SEE HERE

        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return CreatePage();
              });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 5),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.edit_note,
                      color: AppStyle.iconsColor,
                    ),
                    Text(
                      "Your's Notes ",
                      style: AppStyle.mainTitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const NoteCard(),
        ],
      ),
    );
  }
}
