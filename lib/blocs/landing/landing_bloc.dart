import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:passing_bloc_multiblocprovider_poc/blocs/blocs.dart';
import 'package:passing_bloc_multiblocprovider_poc/screens/screens.dart';

class LandingBloc extends Bloc<BaseEvent, BaseState> {
  LandingBloc() : super(InitializedState());

  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
  ) async* {
    if (event is UpdateEvent) {
      final _context = event.data['ctx'];
      final _authState = event.data['authState'];
      final _next = event.data['next'];

      if (_next.settings.name == 'profileScreen' &&
          _authState is GuestModeState) {
        Navigator.push(
          _context,
          SigninScreen.route(args: {'nextScreen': _next}),
        );
      } else {
        Navigator.push(_context, _next);
      }
    }
  }
}
