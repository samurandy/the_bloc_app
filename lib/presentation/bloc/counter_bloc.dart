import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';
import '../../domain/usecases/increment_counter.dart';
import '../../domain/usecases/decrement_counter.dart';

/// BLoC encargado de la lógica de presentación del contador.
/// Recibe eventos desde la UI, interactúa con los casos de uso y emite estados.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;

  CounterBloc({
    required this.incrementCounter,
    required this.decrementCounter,
  }) : super(const CounterInitial()) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
  }

  Future<void> _onIncrement(
      IncrementEvent event, Emitter<CounterState> emit) async {
    emit(CounterLoading());
    try {
      final counter = await incrementCounter();
      emit(CounterLoaded(value: counter.value));
    } catch (e) {
      emit(const CounterError(message: 'Error al incrementar'));
    }
  }

  Future<void> _onDecrement(
      DecrementEvent event, Emitter<CounterState> emit) async {
    emit(CounterLoading());
    try {
      final counter = await decrementCounter();
      emit(CounterLoaded(value: counter.value));
    } catch (e) {
      emit(const CounterError(message: 'Error al decrementar'));
    }
  }
}
