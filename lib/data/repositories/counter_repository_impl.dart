import '../../domain/entities/counter.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_data_source.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<Counter> increment() async {
    try {
      final counterModel = await localDataSource.incrementCounter();
      return counterModel.toEntity();
    } catch (e) {
      // retornar un error específico
      rethrow;
    }
  }

  @override
  Future<Counter> decrement() async {
    try {
      final counterModel = await localDataSource.decrementCounter();
      return counterModel.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
