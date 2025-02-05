import 'package:equatable/equatable.dart';

/// Estados del BLoC del contador.
abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

/// Estado inicial.
class CounterInitial extends CounterState {
  final int value;

  const CounterInitial({this.value = 0});

  @override
  List<Object> get props => [value];
}

/// Estado de carga en progreso.
class CounterLoading extends CounterState {}

/// Estado que representa un contador actualizado.
class CounterLoaded extends CounterState {
  final int value;

  const CounterLoaded({required this.value});

  @override
  List<Object> get props => [value];
}

/// Estado de error con un mensaje descriptivo.
class CounterError extends CounterState {
  final String message;

  const CounterError({required this.message});

  @override
  List<Object> get props => [message];
}
