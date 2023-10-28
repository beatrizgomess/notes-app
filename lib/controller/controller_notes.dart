import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/service/notes_service.dart';
import 'package:notes_app/view/notes_principal_page.dart';

class NotesController extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  Notes notes = Notes();
  final NotesService _service = NotesService();

  List<Notes> _notesList = [];

  List<Notes> get note => _notesList;

  getAllNotes() async {
    isLoading = true;
    final response = await _service.getAll();
    _notesList = response;
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }

  removeNotes(Notes notes) async {
    isLoading = true;
    await _service.deleteNotes(notes);
    _notesList.remove(notes.id!);
    getAllNotes();
    notifyListeners();
  }

  updateNotes(Notes notes) async {
    isLoading = true;
    await _service.updateNotes(notes);
    getAllNotes();
    notifyListeners();
  }

  createNotes(Notes notes) async {
    isLoading = true;
    await _service.createNotes(notes);
    _notesList.add(notes);
    getAllNotes();
    notifyListeners();
  }

  load() {
    Duration(milliseconds: 5);
    CircularProgressIndicator();
  }

  navigatorNotesPage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotesPage(),
        ));
  }
}
