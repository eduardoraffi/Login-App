import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static const String LOGGED_IN = "logged_in";

  @override
  LoginState get initialState => InitializeLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginInitializeEvent) {
      yield* _mapLoginInitializeToState(event);
    } else if (event is PressedButtonEvent) {
      yield* _mapLoginToState(event);
    }
  }

  Stream<LoginState> _mapLoginInitializeToState(
      LoginInitializeEvent event) async* {
    bool status = (await SharedPreferences.getInstance()).getBool(LOGGED_IN);
    if (status != null && status) {
      yield LoggedInState();
    } else {
      yield InitialLoginState();
    }
  }

  Stream<LoginState> _mapLoginToState(PressedButtonEvent event) async* {
    (await SharedPreferences.getInstance()).setBool(LOGGED_IN, true);
    yield LoggedInState();
  }
}
