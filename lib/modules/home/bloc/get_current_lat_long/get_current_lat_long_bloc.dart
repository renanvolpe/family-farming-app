import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:organaki_app/services/get_current_location_service.dart';

part 'get_current_lat_long_event.dart';
part 'get_current_lat_long_state.dart';

class GetCurrentLatLongBloc
    extends Bloc<GetCurrentLatLongEvent, GetCurrentLatLongState> {
  GetCurrentLatLongBloc() : super(GetCurrentLatLongInitial()) {
    on<GetCurrentLocationStart>((event, emit) {
      emit(GetCurrentLatLongProgress());
      GetCurrentLocationService getCurrentLocationService =
          GetCurrentLocationService();
      var response = getCurrentLocationService.getCurrentLatLong();
      
    });
  }
}
