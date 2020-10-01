part of 'authentication_bloc.dart';

class GuestModeState extends BaseState {
  @override
  String toString() {
    return 'GuestModeState';
  }
}

class AuthenticatedState extends BaseState {
  final data;
  final timestamp;

  AuthenticatedState({
    this.data,
    this.timestamp,
  });

  @override
  List<Object> get props => [
        data,
        timestamp,
      ];

  @override
  String toString() {
    return 'AuthenticatedState { timestamp: $timestamp, data: $data }';
  }
}
