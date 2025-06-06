part of 'login_bloc.dart';


sealed class LoginEvent {}

class LogRequested extends LoginEvent {
  final LoginRequestModel requestModel;

  LogRequested({required this.requestModel});
}
