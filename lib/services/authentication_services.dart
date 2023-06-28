import 'package:dio/dio.dart';
import 'package:organaki_app/core/endpoints.dart';
import 'package:organaki_app/models/singleton_user.dart';
import 'package:organaki_app/models/user.dart';
import 'package:result_dart/result_dart.dart';

abstract class AuthenticationService {
  Future<Result<User, String>> doLoginUser(String username, String password);
  registerUser();
  setupServiceUser();
}

class AuthenticationRepository implements AuthenticationService {
  final dio = Dio();
  String? errorMessage;

  @override
  Future<Result<User, String>> doLoginUser(
      String username, String password) async {
    //Map<String, dynamic>? params = {"username":username, "password": password};
    // Map<String, dynamic>? header = {};
    // Map body = {};
    var response = await dio.get(
      Endpoints.baseUrlMock + Endpoints.loginMock,
      // queryParameters: params, data: body, options: Options(headers: header)
    );
    try {
      if (response.statusCode == 200) {
        User user = User.fromMap(response.data);
        //TODO put in shared preference here

        //Success way here :)
        //save user in singleton
        SingletonUser().setUserAuth(user);
        return Success(user);
      } else if (response.statusCode == 400) {
        errorMessage = "Chamada feita de maneira errada";
      } else if (response.statusCode == 500) {
        errorMessage = "Sistema fora do ar, contate o adiminstrador";
      }
    } catch (e) {
      print("Error AuthenticationRepository ::  doLoginUser :: $e ");
      errorMessage = "Erro do sistema";
    }
    return Failure(errorMessage ?? "Erro não esperado");
  }

  @override
  registerUser() {
    throw UnimplementedError();
  }

  @override
  setupServiceUser() {
    throw UnimplementedError();
  }
}
