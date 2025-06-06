import 'package:bloc/bloc.dart';
import 'package:canarry_app1/data/model/request/auth/login_request_mode.dart';
import 'package:canarry_app1/data/model/response/auth_response_model.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
