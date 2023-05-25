import 'package:flutter_test/flutter_test.dart';
import 'package:organaki_app/services/authentication_services.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Test authentication services", () {
    AuthenticationRepository authRepo = AuthenticationRepository();
    test("Test doLogin function", () async {
      var response = await authRepo.doLoginUser("username", "password");
      expect(response, isA<Success>());
    });
  });
}
