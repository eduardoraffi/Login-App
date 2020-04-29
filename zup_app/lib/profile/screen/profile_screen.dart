import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupapp/login/bloc/bloc.dart';
import 'package:zupapp/main.dart';
import 'package:zupapp/profile/bloc/bloc.dart';
import 'package:zupapp/profile/widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = ProfileBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener(
        bloc: _profileBloc,
        listener: (BuildContext context, ProfileState state) {
          print(state);
        },
        child: BlocBuilder(
          bloc: _profileBloc,
          builder: (context, state) {
            if (state is InitializedProfileState) {
              return _setScreen(state);
            } else if (state is InitialProfileState) {
              _profileBloc.add(InitializeProfileEvent());
              return _loading();
            } else if( state is LogoutState){
              loginBloc.add(LoginInitializeEvent());
            }
            return _loading();
          },
        ),
      ),
    );
  }

  _loading() => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );

  _setScreen(InitializedProfileState state) =>
      ProfileWidget(userInfo: state.userInfo, profileBloc: _profileBloc);
}
