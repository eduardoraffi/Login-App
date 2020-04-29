import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zupapp/login/bloc/bloc.dart';
import 'package:zupapp/model/UserInfo.dart';
import 'package:zupapp/profile/bloc/bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileState get initialState => InitialProfileState();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is InitializeProfileEvent) {
      yield* _mapInitializeProfileToState(event);
    } else if (event is LogoutEvent) {
      yield* _mapLogoutToState(event);
    }
  }

  Stream<ProfileState> _mapInitializeProfileToState(event) async* {
    ///get Job List
    UserInfo userInfo = UserInfo(
        name: "Eduardo Raffi",
        age: 25,
        intrested: 'Mobile',
        email: 'eduardo.raffi94@gmail.com',
        phone: '(19) 9 9383-0373');

    yield InitializedProfileState(userInfo: userInfo);
  }

  Stream<ProfileState> _mapLogoutToState(event) async* {
    (await SharedPreferences.getInstance()).setBool(LoginBloc.LOGGED_IN, false);
    yield LogoutState();
  }
}
