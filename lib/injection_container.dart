import 'package:get_it/get_it.dart';

import 'data/datasources/counter_local_data_source.dart';
import 'data/repositories/counter_repository_impl.dart';
import 'domain/repositories/counter_repository.dart';
import 'domain/usecases/decrement_counter.dart';
import 'domain/usecases/increment_counter.dart';
import 'presentation/bloc/counter_bloc.dart';

final sl = GetIt.instance; // sl => Service Locator

/// Función para inicializar la inyección de dependencias.
Future<void> init() async {
  // Capa de Presentación: Registra el BLoC como factory.
  sl.registerFactory(() => CounterBloc(
        incrementCounter: sl<IncrementCounter>(),
        decrementCounter: sl<DecrementCounter>(),
      ));

  // Capa de Dominio: Casos de uso.
  sl.registerLazySingleton<IncrementCounter>(
      () => IncrementCounter(sl<CounterRepository>()));
  sl.registerLazySingleton<DecrementCounter>(
      () => DecrementCounter(sl<CounterRepository>()));

  // Capa de Datos: Repositorio e Data Source.
  sl.registerLazySingleton<CounterRepository>(() =>
      CounterRepositoryImpl(localDataSource: sl<CounterLocalDataSource>()));
  sl.registerLazySingleton<CounterLocalDataSource>(
      () => CounterLocalDataSourceImpl());
}
