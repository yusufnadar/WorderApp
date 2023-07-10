import '../../core/base/model/base_model.dart';

class WordsModel extends BaseModel<WordsModel> {
  int? id;
  String? word;
  String? meaning;
  bool? favorite;

  WordsModel({this.id, this.meaning, this.word, this.favorite});

  @override
  WordsModel fromJson(Map<String, dynamic> json) => WordsModel(
        id: json['id'],
        word: json['word'],
        meaning: json['meaning'],
        favorite: json['favorite'] == 0 ? false : true,
      );

  WordsModel copyWith({
    int? id,
    String? word,
    String? meaning,
    bool? favorite,
  }) {
    return WordsModel(
      id: id ?? this.id,
      word: word ?? this.word,
      meaning: meaning ?? this.meaning,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'word': word,
        'meaning': meaning,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordsModel &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          meaning == other.meaning;

  @override
  int get hashCode => word.hashCode;
}
