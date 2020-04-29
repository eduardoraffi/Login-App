import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:zupapp/model/JobInfo.dart';

@immutable
abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class InitializeFeedEvent extends FeedEvent {
  @override
  String toString() {
    return 'InitializeFeedEvent';
  }
}

class ApplyButtonEvent extends FeedEvent {
  final JobInfo jobInfo;

  ApplyButtonEvent({this.jobInfo});

  @override
  List<Object> get props => [jobInfo];

  @override
  String toString() {
    return 'ApplyButtonEvent';
  }
}
