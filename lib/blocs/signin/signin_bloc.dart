import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:passing_bloc_multiblocprovider_poc/blocs/blocs.dart';

class SigninBloc extends Bloc<BaseEvent, BaseState> {
  SigninBloc() : super(InitializedState());

  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
  ) async* {
    if (event is UpdateEvent) {
      yield AuthenticatedState(data: event.data);
    }
  }
}
