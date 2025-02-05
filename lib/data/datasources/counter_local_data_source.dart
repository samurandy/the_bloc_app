import '../models/counter_model.dart';

abstract class CounterLocalDataSource {
  Future<CounterModel> getCounter();
  Future<CounterModel> incrementCounter();
  Future<CounterModel> decrementCounter();
}

class CounterLocalDataSourceImpl extends CounterLocalDataSource {
  int _counterValue = 0;

  /// Obtiene el valor actual del contador.
  @override
  Future<CounterModel> getCounter() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return CounterModel(value: _counterValue);
  }

  @override
  Future<CounterModel> incrementCounter() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _counterValue++;
    return CounterModel(value: _counterValue);
  }

  @override
  Future<CounterModel> decrementCounter() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _counterValue--;
    return CounterModel(value: _counterValue);
  }
}
