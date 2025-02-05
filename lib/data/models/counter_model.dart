import '../../domain/entities/counter.dart';

class CounterModel extends Counter {
  CounterModel({required super.value});

  /// Crea un CounterModel a partir de una entidad.
  factory CounterModel.fromEntity(Counter counter) {
    return CounterModel(value: counter.value);
  }

  /// Convierte el modelo en una entidad del dominio.
  Counter toEntity() {
    return Counter(value: value);
  }
}
