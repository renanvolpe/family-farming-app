import 'package:flutter_test/flutter_test.dart';
import 'package:organaki_app/services/producer_services.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Test Producer services", () {
    ProducerRepository producerRepo = ProducerRepository();
    test("Test get a producer function", () async {
      var response = await producerRepo.getAProducer("8dd0df98-78cb-4029-9303-9f2c33d8992c");
      expect(response, isA<Success>());
    });

     test("Test listProdcer function", () async {
      var response = await producerRepo.getListProducers();
      expect(response, isA<Success>());
    });

    test("Test tags list", () async {
      var response = await producerRepo.getTags();
      expect(response, isA<Success>());
    });
  });
}
