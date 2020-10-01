import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object> get props => [];
}

class InitializeEvent extends BaseEvent {
  final data;
  final timestamp;

  InitializeEvent({
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
    return 'InitializeEvent { timestamp: $timestamp, data: $data }';
  }
}

class UpdateEvent extends BaseEvent {
  final data;
  final timestamp;

  UpdateEvent({
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
    return 'UpdateEvent { timestamp: $timestamp, data: $data }';
  }
}

class RefreshEvent extends BaseEvent {
  final data;
  final args;
  final timestamp;

  RefreshEvent({
    this.data,
    this.args,
    this.timestamp,
  });

  @override
  List<Object> get props => [
        data,
        args,
        timestamp,
      ];

  @override
  String toString() {
    return 'RefreshEvent { timestamp: $timestamp, data: $data, args: $args }';
  }
}
