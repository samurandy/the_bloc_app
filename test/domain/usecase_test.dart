import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_bloc_app/domain/entities/counter.dart';
import 'package:the_bloc_app/domain/repositories/counter_repository.dart';
import 'package:the_bloc_app/domain/usecases/increment_counter.dart';
import 'package:the_bloc_app/domain/usecases/decrement_counter.dart';

// Mock del repositorio
class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  late IncrementCounter incrementUseCase;
  late DecrementCounter decrementUseCase;
  late MockCounterRepository mockRepository;

  setUp(() {
    mockRepository = MockCounterRepository();
    incrementUseCase = IncrementCounter(mockRepository);
    decrementUseCase = DecrementCounter(mockRepository);
  });

  test('Debe retornar un Counter con el valor incrementado', () async {
    // Arrange: Configuramos el mock
    when(() => mockRepository.increment()).thenAnswer(
      (_) async => const Counter(value: 1),
    );

    // Act
    final result = await incrementUseCase();

    // Assert
    expect(result.value, 1);
    verify(() => mockRepository.increment())
        .called(1); // Verificamos que se llame al repositorio
  });

  test('Debe retornar un Counter con el valor decrementado', () async {
    // Arrange: Configuramos el mock
    when(() => mockRepository.decrement()).thenAnswer(
      (_) async => const Counter(value: 0),
    );

    // Act
    final result = await decrementUseCase();

    // Assert
    expect(result.value, 0);
    verify(() => mockRepository.decrement()).called(1);
  });
}
