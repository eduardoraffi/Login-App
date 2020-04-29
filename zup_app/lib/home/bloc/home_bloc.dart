import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zupapp/home/bloc/bloc.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
  }
}
