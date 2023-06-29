import 'package:flutter_test/flutter_test.dart';
import 'package:organaki_app/models/user.dart';
import 'package:organaki_app/services/authentication_services.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Test authentication services", () {
    AuthenticationRepository authRepo = AuthenticationRepository();
    test("Test doLogin function", () async {
      var response = await authRepo.doLoginUser("username", "password");
      expect(response, isA<Success>());
    });

    test("Test Register function", () async {
      var user = User("Renan", "renan@volpe.com", "Volpe", "123", "");
      var response = await authRepo.registerUser(user);
      expect(response, isA<Success>());
    });
  });
}
