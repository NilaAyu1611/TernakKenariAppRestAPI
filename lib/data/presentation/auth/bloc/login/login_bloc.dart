import 'package:bloc/bloc.dart';
import 'package:canarry_app1/data/model/request/auth/login_request_mode.dart';
import 'package:canarry_app1/data/model/response/auth_response_model.dart';
import 'package:canarry_app1/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
  on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final result = await authRepository. login(event. requestModel);

    result. fold(
      (l) => emit(LoginFailure(error: l)),
      (r) => emit(LoginSuccess(responseModel: r)),
    );
  } 
}

