import 'package:flutter/material.dart';
import 'package:zupapp/model/UserInfo.dart';
import 'package:zupapp/profile/bloc/bloc.dart';

class ProfileWidget extends StatefulWidget {
  final UserInfo userInfo;
  final ProfileBloc profileBloc;

  const ProfileWidget({Key key, this.userInfo, this.profileBloc})
      : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  static const double radiusValue = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(radiusValue),
        color: Colors.transparent,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          _getProfileAvatar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: double.infinity,
                child: SizedBox.expand(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radiusValue)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _getContent(),
                        _getLogoutButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _getProfileAvatar() => Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Center(
            child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.black87,
                ))),
      );

  _getContent() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        widget.userInfo.name.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                    )),
                SizedBox(height: 64),
                _getInfoRow("Área de interesse: ", widget.userInfo.intrested),
                SizedBox(height: 16),
                _getInfoRow("Age: ", widget.userInfo.age.toString()),
                SizedBox(height: 16),
                _getInfoRow("Email: ", widget.userInfo.email),
                SizedBox(height: 16),
                _getInfoRow("Phone: ", widget.userInfo.phone),
                SizedBox(height: 16)
              ],
            ),
          ),
        ),
      );

  _getLogoutButton(context) => Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 4,
          color: Color(0xff003054),
          child: InkWell(
            splashColor: Colors.white30,
            borderRadius: BorderRadius.circular(radiusValue / 2),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(32)),
              child: Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                widget.profileBloc.add(LogoutEvent(context));
              });
            },
          ),
        ),
      );

  _getInfoRow(String label, String info) => Row(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 20),
          ),
          Text(info,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 20))
        ],
      );
}
