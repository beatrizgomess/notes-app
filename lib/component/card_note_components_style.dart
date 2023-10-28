import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/component/controller/controller_card_note_components.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/themes/app_style.dart';
import 'package:notes_app/view/notes_create_page.dart';
import 'package:notes_app/view/notes_reader.dart';

class CardTodoListComponent extends StatefulWidget {
  CardTodoListComponent(
      {super.key,
      required this.title,
      required this.description,
      required this.createdAt,
      this.done,
      required this.id,
      required this.edit,
      required this.delete});
  String title;
  String description;
  String createdAt;
  String? done;
  int id;
  String isValid = "true";
  final VoidCallback delete;
  final VoidCallback edit;

  @override
  State<CardTodoListComponent> createState() => _CardTodoListComponentState();
}

class _CardTodoListComponentState extends State<CardTodoListComponent> {
  bool checked = false;
  String truncatedText = "";
  final ControllerCardNoteComponent _controllerCardNoteComponent =
      ControllerCardNoteComponent();
  final Color _randomColor = Colors.blue;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStyle.background,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Expanded(
                            child: Text(
                                truncatedText = widget.title.length > 27
                                    ? '${widget.title.substring(0, 27)}...'
                                    : widget.title,
                                maxLines: 5,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyle.mainTitle),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        widget.description,
                        maxLines: 5,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.mainContent,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, top: 20),
                          child: Text(
                            widget.createdAt,
                            maxLines: 5,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.dateTime,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: widget.edit,
                                icon: Icon(
                                  Icons.edit,
                                  color: AppStyle.iconsColor,
                                )),
                            IconButton(
                                onPressed: widget.delete,
                                icon: Icon(
                                  Icons.delete,
                                  color: AppStyle.iconsColor,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TodoListReaderView(
                title: widget.title,
                description: widget.description,
                createdAt: widget.createdAt);
          }));
        },
      ),
    );
  }
}
