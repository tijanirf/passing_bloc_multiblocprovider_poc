import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:passing_bloc_multiblocprovider_poc/blocs/blocs.dart';

class SigninBloc extends Bloc<BaseEvent, BaseState> {
  final AuthenticationBloc _authenticationBloc;

  SigninBloc(this._authenticationBloc) : super(InitializedState());

  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
  ) async* {
    if (event is UpdateEvent) {
      _authenticationBloc.add(UpdateEvent(data: event.data));
    }
  }
}
