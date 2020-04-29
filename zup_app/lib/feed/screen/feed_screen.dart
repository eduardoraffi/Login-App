import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupapp/feed/bloc/bloc.dart';
import 'package:zupapp/feed/widgets/card_widget.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  FeedBloc _feedBloc;

  @override
  void initState() {
    _feedBloc = FeedBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener(
        bloc: _feedBloc,
        listener: (BuildContext context, FeedState state) {
          print(state);
        },
        child: BlocBuilder(
          bloc: _feedBloc,
          builder: (context, state) {
            if (state is ApplyClickedFeedState) {
              ///Show navigator
              debugPrint(state.toString() + " Pressed");
//              _feedBloc.add(ApplyButtonEvent());
            } else if (state is InitializedFeedState) {
              return _setScreen(state);
            } else if (state is InitialFeedState) {
              _feedBloc.add(InitializeFeedEvent());
              return _loading();
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

  _setScreen(InitializedFeedState state) => ListView.builder(
      itemBuilder: (context, pos) {
        return Container(
          margin: EdgeInsets.fromLTRB(14, 8, 14, 8),
          child: CardWidget(
              companyName: state.jobInfo[pos].companyName,
              feedBloc: _feedBloc,
              jobDescription: state.jobInfo[pos].jobDescription,
              jobType: state.jobInfo[pos].jobType),
        );
      },
      itemCount: state.jobInfo.length);
}
