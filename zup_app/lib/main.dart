import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupapp/home/widgets/home_screen.dart';
import 'package:zupapp/login/bloc/bloc.dart';

import 'login/screen/login_screen.dart';

void main() => runApp(AppMain());

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login & Register",
      home: LoginPage(),
    );
  }
}
LoginBloc loginBloc;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener(
        bloc: loginBloc,
        listener: (BuildContext context, LoginState state) {
          print(state);
        },
        child: BlocBuilder(
          bloc: loginBloc,
          builder: (context, state) {
            if (state is InitializeLoginState) {
              loginBloc.add(LoginInitializeEvent());
            } else if (state is InitialLoginState) {
              return _getLoginPage(context);
            } else if (state is LoggedInState) {
              return HomeScreen();
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

  _getLoginPage(BuildContext context) => Scaffold(
        backgroundColor: Color(0xff6CC72A),
        body: Container(
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width * .1,
              top: MediaQuery.of(context).size.width * .1),
          decoration: BoxDecoration(
              color: Color(0xff003054),
              borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(MediaQuery.of(context).size.width * .3),
                  topRight:
                      Radius.circular(MediaQuery.of(context).size.width * .3))),
          child: Container(
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(48, 32, 48, 32),
            child: LoginFormWidget(loginBloc: loginBloc),
          ),
        ),
      );
}
