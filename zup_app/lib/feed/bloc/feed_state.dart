import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:zupapp/model/JobInfo.dart';

@immutable
abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class InitialFeedState extends FeedState {
  @override
  String toString() {
    return 'InitialFeedState';
  }
}

class InitializedFeedState extends FeedState {
  final List<JobInfo> jobInfo;

  InitializedFeedState({@required this.jobInfo});

  @override
  List<Object> get props => [jobInfo];

  @override
  String toString() {
    return 'InitializedFeedState';
  }
}

class ApplyClickedFeedState extends FeedState {
  final JobInfo jobInfo;

  ApplyClickedFeedState({@required this.jobInfo});

  @override
  List<Object> get props => [jobInfo];

  @override
  String toString() {
    return 'ApplyClickedFeedState';
  }
}
