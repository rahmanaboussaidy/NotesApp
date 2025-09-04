import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String id;
  final String title;
  final String subtitles;

  const NoteModel({
    required this.title,
    required this.subtitles,
    required this.id,
  });

  NoteModel copyWith({String? newId, String? newTitle, String? newSubtitles}) {
    return NoteModel(
      title: newTitle ?? this.title,
      subtitles: newSubtitles ?? this.subtitles,
      id: newId ?? this.id,
    );
  }

  @override
  List<Object?> get props => [title, subtitles];
}
