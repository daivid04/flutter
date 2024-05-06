import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/insfrastructure/models/model_answer.dart';
import 'package:dio/dio.dart';

class GetGitImage {
  final _dio = Dio(); //Para las peticiones http

  Future<Message> getAnswer() async {
    final response = await _dio
        .get('https://yesno.wtf/api'); //agarra todos los valores de la petición
    final modelAnswer = ModelAnswer.fromJson(response.data);
    return modelAnswer.toMessageEntity();
  }
}
