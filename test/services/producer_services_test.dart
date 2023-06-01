import 'package:flutter_test/flutter_test.dart';
import 'package:organaki_app/services/producer_services.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Test Producer services", () {
    ProducerRepository producerRepo = ProducerRepository();
    test("Test listProdcer function", () async {
      var response = await producerRepo.getListProducers();
      expect(response, isA<Success>());
    });
  });
}
