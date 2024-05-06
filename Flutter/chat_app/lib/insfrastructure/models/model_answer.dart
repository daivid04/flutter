// To parse this JSON data, do
//
//     final modelAnswer = modelAnswerFromJson(jsonString);

import 'package:chat_app/domain/entities/message.dart';

class ModelAnswer {
  final String answer;
  final bool forced;
  final String image;

  ModelAnswer({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory ModelAnswer.fromJson(Map<String, dynamic> json) => ModelAnswer(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() =>
      Message(text: answer, fromWho: FromWho.your, url: image);
}
