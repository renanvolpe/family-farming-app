import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_a_producer_event.dart';
part 'get_a_producer_state.dart';

class GetAProducerBloc extends Bloc<GetAProducerEvent, GetAProducerState> {
  GetAProducerBloc() : super(GetAProducerInitial()) {
    on<GetAProducerStart>((event, emit) {
      // do call to get a producer here :)
      // see listProducer as example to proceed that
    });
  }
}
