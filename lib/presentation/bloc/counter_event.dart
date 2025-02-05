import 'package:equatable/equatable.dart';

/// Eventos que puede emitir el BLoC del contador.
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

/// Evento para incrementar el contador.
class IncrementEvent extends CounterEvent {}

/// Evento para decrementar el contador.
class DecrementEvent extends CounterEvent {}
