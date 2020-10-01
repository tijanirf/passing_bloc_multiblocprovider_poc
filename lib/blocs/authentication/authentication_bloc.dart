import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:passing_bloc_multiblocprovider_poc/blocs/blocs.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<BaseEvent, BaseState> {
  AuthenticationBloc() : super(InitializedState());

  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
  ) async* {
    if (event is InitializeEvent) {
      yield* _mapInitializeEventToState();
    } else if (event is UpdateEvent) {
      yield* _mapUpdateEventToState(event.data);
    }
  }

  Stream<BaseState> _mapInitializeEventToState() async* {
    // Default splash screen time
    await Future.delayed(Duration(seconds: 1));

    yield GuestModeState();
  }

  Stream<BaseState> _mapUpdateEventToState(data) async* {
    yield AuthenticatedState(data: data);
  }
}
