// ignore: file_names
import 'package:flutter/material.dart';
import 'package:notes_app/themes/app_style.dart';

class TodoListReaderView extends StatefulWidget {
  TodoListReaderView(
      {super.key,
      required this.title,
      required this.description,
      required this.createdAt});
  String title;
  String description;
  String createdAt;
  String? done;

  @override
  State<TodoListReaderView> createState() => _TodoListReaderViewState();
}

class _TodoListReaderViewState extends State<TodoListReaderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(
        backgroundColor: AppStyle.background,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(widget.title,
                      softWrap: true,
                      maxLines: 50,
                      style: AppStyle.titleReaderView),
                ),
                const SizedBox(height: 20),
                const SizedBox(width: 5),
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(width: 10),
                    Text(
                      "Criado em: ${widget.createdAt}",
                      style: AppStyle.dateTime,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    children: [
                      const Icon(Icons.sort),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(widget.description,
                            softWrap: true,
                            maxLines: 50,
                            style: AppStyle.contentReaderView),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
