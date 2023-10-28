import 'package:notes_app/model/notes_model.dart';

abstract class NotesRepository {
  Future<void> getAll();
  Future<void> createNotes(Notes notes);
  Future<void> deleteNotes(Notes notes);
  Future<Notes> updateNotes(Notes notes);
}
