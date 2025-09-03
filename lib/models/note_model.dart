import 'package:equatable/equatable.dart';

class NoteModel extends Equatable{
  final String title;
  final String subtitles;

  NoteModel({required this.title, required this.subtitles});
  
  @override
  List<Object?> get props => [title, subtitles];

  

}
