import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc() : super(RegisterUserInitial()) {
    on<RegisterUserStart>((event, emit) {
      //do register user calls here :)
       // see LoginAuth as example to proceed that
    });
  }
}
