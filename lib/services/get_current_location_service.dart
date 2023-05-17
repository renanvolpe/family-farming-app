import 'package:latlong2/latlong.dart';
import 'package:result_dart/result_dart.dart';

class GetCurrentLocationService {
  Future<Result<LatLng, String>> getCurrentLatLong() async {
    
    return const Failure("_failure");
  }
}
