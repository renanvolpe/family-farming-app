import 'package:dio/dio.dart';
import 'package:organaki_app/core/endpoints.dart';
import 'package:organaki_app/models/producer.dart';
import 'package:result_dart/result_dart.dart';

abstract class ProducerService {
  Future<Result<List<Producer>, String>> getListProducers();
  getAProducer(String id);
  editProducer();
  deleteProducer();
}

class ProducerRepository implements ProducerService {
  final dio = Dio();
  String? errorMessage;

  @override
  Future<Result<List<Producer>, String>> getListProducers() async {
    //Map<String, dynamic>? params = {"username":username, "password": password};
    // Map<String, dynamic>? header = {};
    // Map body = {};
    var response = await dio.get(
      Endpoints.baseUrl + Endpoints.producers,
      // queryParameters: params, data: body, options: Options(headers: header)
    );
    try {
      if (response.statusCode == 200) {
        List<Producer> listProducer = [];
        var listProducerMap = response.data["producers"];

        for (int i = 0; i < listProducerMap.length; i++) {
          listProducer.add(Producer.fromMap(listProducerMap[i]));
        }

        return Success(listProducer);
      } else if (response.statusCode == 400) {
        errorMessage = "Chamada feita de maneira errada";
      } else if (response.statusCode == 500) {
        errorMessage = "Sistema fora do ar, contate o adiminstrador";
      }
    } catch (e) {
      print(
          "${response.statusCode} Error ProducerRepository ::  getListProducers :: $e ");
      errorMessage = "Erro do sistema";
    }
    return Failure(errorMessage ?? "Erro não esperado");
  }

  registerUser() {
    throw UnimplementedError();
  }

  setupServiceUser() {
    throw UnimplementedError();
  }

  @override
  deleteProducer() {
    // TODO: implement deleteProducer
    throw UnimplementedError();
  }

  @override
  editProducer() {
    // TODO: implement editProducer
    throw UnimplementedError();
  }

  @override
  Future<Result<Producer, String>> getAProducer(String id) async {
    var response = await dio.get(
      "${Endpoints.baseUrl}${Endpoints.producers}/$id",
      //queryParameters: {'id': id},
    );
    try {
      if (response.statusCode == 200) {
        Producer prod = Producer.fromMap(response.data["producer"]);
        print(prod);
        return Success(prod);
      } else if (response.statusCode == 400) {
        errorMessage = "Chamada feita de maneira errada";
      } else if (response.statusCode == 500) {
        errorMessage = "Sistema fora do ar, contate o administrador";
      }
    } catch (e) {
      print(
          "${response.statusCode} Error ProducerRepository ::  getAProducer :: $e ");
      errorMessage = "Erro do sistema";
    }
    return Failure(errorMessage ?? "Erro não esperado");
  }
}
