import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_bloc_app/data/datasources/counter_local_data_source.dart';
import 'package:the_bloc_app/data/models/counter_model.dart';
import 'package:the_bloc_app/data/repositories/counter_repository_impl.dart';
import 'package:the_bloc_app/domain/entities/counter.dart';

// Mock del data source
class MockCounterLocalDataSource extends Mock
    implements CounterLocalDataSource {}

void main() {
  late CounterRepositoryImpl repository;
  late MockCounterLocalDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockCounterLocalDataSource();
    repository = CounterRepositoryImpl(localDataSource: mockDataSource);
  });

  test('Debería retornar un Counter incrementado', () async {
    // Arrange: Configuramos el mock
    when(() => mockDataSource.incrementCounter()).thenAnswer(
      (_) async => CounterModel(value: 1),
    );

    // Act
    final result = await repository.increment();

    // Assert
    expect(result, isA<Counter>());
    expect(result.value, 1);
    verify(() => mockDataSource.incrementCounter())
        .called(1); // Verificamos que se llame al método
  });
}
