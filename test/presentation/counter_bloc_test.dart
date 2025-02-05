import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_bloc_app/domain/entities/counter.dart';
import 'package:the_bloc_app/domain/usecases/decrement_counter.dart';
import 'package:the_bloc_app/domain/usecases/increment_counter.dart';
import 'package:the_bloc_app/presentation/bloc/counter_bloc.dart';
import 'package:the_bloc_app/presentation/bloc/counter_event.dart';
import 'package:the_bloc_app/presentation/bloc/counter_state.dart';

// Mocks para los casos de uso
class MockIncrementCounter extends Mock implements IncrementCounter {}

class MockDecrementCounter extends Mock implements DecrementCounter {}

void main() {
  late CounterBloc bloc;
  late MockIncrementCounter mockIncrement;
  late MockDecrementCounter mockDecrement;

  setUp(() {
    mockIncrement = MockIncrementCounter();
    mockDecrement = MockDecrementCounter();
    bloc = CounterBloc(
      incrementCounter: mockIncrement,
      decrementCounter: mockDecrement,
    );
  });

  group('CounterBloc', () {
    blocTest<CounterBloc, CounterState>(
      'Emite [CounterLoading, CounterLoaded] al IncrementEvent',
      setUp: () {
        when(() => mockIncrement())
            .thenAnswer((_) async => const Counter(value: 1));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(IncrementEvent()),
      expect: () => [
        isA<CounterLoading>(),
        const CounterLoaded(value: 1),
      ],
    );

    blocTest<CounterBloc, CounterState>(
      'Emite [CounterLoading, CounterLoaded] al DecrementEvent',
      setUp: () {
        when(() => mockDecrement())
            .thenAnswer((_) async => const Counter(value: 0));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(DecrementEvent()),
      expect: () => [
        isA<CounterLoading>(),
        const CounterLoaded(value: 0),
      ],
    );

    blocTest<CounterBloc, CounterState>(
      'Emite [CounterLoading, CounterError] al error en DecrementEvent',
      setUp: () {
        when(() => mockDecrement()).thenThrow(Exception('Error'));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(DecrementEvent()),
      expect: () => [
        isA<CounterLoading>(),
        const CounterError(message: 'Error al decrementar'),
      ],
    );
  });
}
