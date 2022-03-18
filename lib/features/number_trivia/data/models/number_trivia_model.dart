import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    required this.text,
    required this.number,
  }) : super(
          text: text,
          number: number,
        );
  final String text;
  final int number;

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      NumberTriviaModel(
        text: json["text"] as String,
        number: (json["number"] as num).toInt(),
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'text': text,
      'number': number,
    };
  }
}
