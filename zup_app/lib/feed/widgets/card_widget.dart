import 'package:flutter/material.dart';
import 'package:zupapp/feed/bloc/bloc.dart';

class CardWidget extends StatelessWidget {
  final String companyName;
  final String jobType;
  final String jobDescription;

  final FeedBloc feedBloc;

  static const double radiusValue = 15;

  const CardWidget(
      {Key key,
      @required this.companyName,
      @required this.jobType,
      @required this.jobDescription,
      @required this.feedBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(radiusValue),
      color: Colors.transparent,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusValue)),
        child: Column(
          children: <Widget>[
            _getCardHeader(),
            SizedBox(height: 16),
            _getContent(),
            SizedBox(height: 16),
            _getApplyButton(),
          ],
        ),
      ),
    );
  }

  _getCardHeader() => Column(
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radiusValue),
                topRight: Radius.circular(radiusValue)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(jobType),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Material(
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Icon(Icons.add_a_photo, size: 30),
                )),
          ),
        ],
      );

  _getContent() => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Text(
                  companyName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 8),
            Container(
                width: double.infinity,
                child: Text(
                  "Descrição:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                )),
            SizedBox(height: 16),
            Text(
              jobDescription,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      );

  _getApplyButton() => Padding(
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
                  "Candidate-se",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () {
              feedBloc.add(ApplyButtonEvent());
            },
          ),
        ),
      );
}
