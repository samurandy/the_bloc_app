import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

class DecrementCounter {
  final CounterRepository repository;

  DecrementCounter(this.repository);

  Future<Counter> call() async {
    return await repository.decrement();
  }
}
