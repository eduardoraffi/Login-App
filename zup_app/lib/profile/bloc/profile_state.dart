import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:zupapp/model/UserInfo.dart';

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class InitialProfileState extends ProfileState {
  @override
  String toString() {
    return 'InitialProfileState';
  }
}

class LogoutState extends ProfileState {
  @override
  String toString() {
    return 'LogoutState';
  }
}

class InitializedProfileState extends ProfileState {
  final UserInfo userInfo;

  InitializedProfileState({@required this.userInfo});

  @override
  List<Object> get props => [userInfo];

  @override
  String toString() {
    return 'InitializedProfileState';
  }
}
