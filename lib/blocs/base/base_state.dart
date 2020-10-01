import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class InitializedState extends BaseState {
  final data;
  final timestamp;

  InitializedState({
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
    return 'InitializeState { timestamp: $timestamp, data: $data }';
  }
}

class LoadingState extends BaseState {
  const LoadingState();

  @override
  List<Object> get props => [];

  String toString() {
    return 'LoadingState';
  }
}

class LoadedState extends BaseState {
  final data;
  final timestamp;

  LoadedState({
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
    return 'LoadedState { timestamp: $timestamp, data: $data }';
  }
}

class EmptyState extends BaseState {
  const EmptyState();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'EmptyState';
  }
}

class ErrorState extends BaseState {
  final String error;

  ErrorState({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'ErrorState { error: $error }';
  }
}
