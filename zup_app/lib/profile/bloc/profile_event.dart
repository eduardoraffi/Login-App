import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class InitializeProfileEvent extends ProfileEvent {
  @override
  String toString() {
    return 'InitializeProfileEvent';
  }
}

class LogoutEvent extends ProfileEvent {
  final BuildContext context;

  LogoutEvent(this.context);

  @override
  List<Object> get props => [context];

  @override
  String toString() {
    return 'LogoutEvent';
  }
}
