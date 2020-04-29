import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class PressedButtonEvent extends LoginEvent {
  @override
  String toString() {
    return 'PressedButtonEvent';
  }
}

class LoginInitializeEvent extends LoginEvent {
  @override
  String toString() {
    return 'LoginInitializeEvent';
  }
}
