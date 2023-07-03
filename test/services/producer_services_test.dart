import 'package:flutter_test/flutter_test.dart';
import 'package:organaki_app/services/producer_services.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Test Producer services", () {
    ProducerRepository producerRepo = ProducerRepository();
    test("Test get a producer function", () async {
      var response = await producerRepo.getAProducer("3e24d816-fdbe-4f8e-b802-5ff57449f0b5");
      expect(response, isA<Success>());
    });

     test("Test listProdcer function", () async {
      var response = await producerRepo.getListProducers();
      expect(response, isA<Success>());
    });
  });
}
