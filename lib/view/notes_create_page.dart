import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/controller/controller_notes.dart';
import 'package:notes_app/service/notes_service.dart';
import 'package:notes_app/themes/app_style.dart';
import 'package:notes_app/view/controller_views/controller_create_page.dart';
import 'package:notes_app/view/notes_principal_page.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _controller = ControllerCreatePage();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _controller.changeFocus(context);
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
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
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Center(
                        child: Text(
                          "New Notes",
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title",
                            style: AppStyle.mainTitle,
                          ),
                          TextFormField(
                            maxLines: 2,
                            maxLength: 50,
                            controller: _controller.titleEditinController,
                            decoration: const InputDecoration(
                              hintText: "Title",
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: AppStyle.mainTitle,
                          ),
                          TextFormField(
                            focusNode: _controller.textNode,
                            maxLines: 5,
                            maxLength: 200,
                            decoration: const InputDecoration(
                              hintText: "Description",
                              border: InputBorder.none,
                            ),
                            controller:
                                _controller.descriptionEditingController,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.all(15),
                          child: FloatingActionButton.extended(
                            label: const Text("Save"),
                            onPressed: () async {
                              Notes note = Notes(
                                  title: _controller.titleEditinController.text,
                                  description: _controller
                                      .descriptionEditingController.text);
                              await _controller.notesController
                                  .createNotes(note);
                              _controller.notesController
                                  .navigatorNotesPage(context);
                            },
                          )),
                    ]),
              ),
            ),
          )),
    );
  }
}
