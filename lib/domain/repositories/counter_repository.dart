import '../entities/counter.dart';

abstract class CounterRepository {
  Future<Counter> increment();
  Future<Counter> decrement();
}
