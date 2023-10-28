import 'dart:convert';
import 'dart:developer';

import 'package:notes_app/constants/constants-api.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/repository/notes_repository.dart';

class NotesService implements NotesRepository {
  Future<List<Notes>> getAll() async {
    final response = await http.get(Uri.parse(Constants.API));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final NotesJson = json
          .map((e) => Notes(
              id: e['id'],
              title: e['title'],
              description: e['description'],
              createdAt: e['createdAt'],
              done: e['done']))
          .toList();
      return NotesJson;
    }
    return [];
  }

  @override
  Future<void> createNotes(Notes notes) async {
    try {
      var responde = await http.post(
        Uri.parse(Constants.API),
        headers: Constants.headers,
        body: jsonEncode(notes.toJson()),
      );
      if (responde.statusCode == 200) {
        log(responde.body);
      }
    } catch (e) {
      throw Exception('Erro ao salvar lista: $e');
    }
  }

  @override
  Future<void> deleteNotes(Notes notes) async {
    try {
      var response = await http.delete(
          Uri.parse('${Constants.API}/${notes.id}'),
          headers: Constants.headers);
      if (response.statusCode == 200) {
        log(response.body);
      }
    } catch (e) {
      throw Exception('Erro ao deletar Lista: $e');
    }
  }

  @override
  Future<Notes> updateNotes(Notes notes) async {
    try {
      await http.put(
        Uri.parse('${Constants.API}/${notes.id}'),
        headers: Constants.headers,
        body: jsonEncode(notes.toJson()),
      );
    } catch (e) {
      throw Exception('Erro ao atualizar Lista: $e');
    }
    return notes;
  }
}
