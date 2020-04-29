import 'package:flutter/material.dart';
import 'package:zupapp/login/bloc/bloc.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({@required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _imageHeader(context),
          Text("Email", style: TextStyle(color: Colors.white)),
          SizedBox(
            height: 16,
          ),
          _defaultTextField(context, isPassword: false),
          SizedBox(
            height: 32,
          ),
          Text("Password", style: TextStyle(color: Colors.white)),
          SizedBox(
            height: 10,
          ),
          _defaultTextField(context, isPassword: true),
          SizedBox(
            height: 64,
          ),
          _loginButton(context),
        ],
      ),
    );
  }

  _imageHeader(context) => Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          padding: EdgeInsets.only(left: 24, right: 24),
          child: Image(
            image: AssetImage("assets/images/app_logo.png"),
            color: Color(0xD16CC72A),
          ),
        ),
      );

  _loginButton(context) => Material(
        borderRadius: BorderRadius.circular(32),
        elevation: 4,
        child: InkWell(
          splashColor: Color(0xff6CC72A),
          borderRadius: BorderRadius.circular(32),
          child: Container(
            height: MediaQuery.of(context).size.height * .065,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(32)),
            child: Center(
              child: Text(
                "Login".toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onTap: () {
            loginBloc.add(PressedButtonEvent());
          },
        ),
      );

  _defaultTextField(context, {@required bool isPassword}) => Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(32),
        child: Container(
          height: MediaQuery.of(context).size.height * .065,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            obscureText: (isPassword) ? true : false,
            keyboardType:
                (!isPassword) ? TextInputType.emailAddress : TextInputType.text,
            cursorColor: Color(0xff6CC72A),
            decoration: InputDecoration(border: InputBorder.none),
            style: TextStyle(color: Colors.black54),
          ),
        ),
      );
}
