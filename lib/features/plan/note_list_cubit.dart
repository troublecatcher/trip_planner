import 'package:bloc/bloc.dart';
import 'package:trip_planner/features/home/domain/note/note.dart';

class NoteListCubit extends Cubit<List<Note>> {
  NoteListCubit() : super([]);
  create(Note note) => emit([...state, note]);
  remove(int index) => emit([...state]..removeAt(index));
  set(List<Note> list) => emit(list);
}
