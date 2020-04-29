import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class InitializeLoginState extends LoginState {
  @override
  String toString() {
    return 'InitializeLoginState';
  }
}
class InitialLoginState extends LoginState {
  @override
  String toString() {
    return 'InitialLoginState';
  }
}

class LoggedInState extends LoginState {
  @override
  String toString() {
    return 'LoginButtonPressedState';
  }
}
