import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injection_container.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

/// Página principal que muestra el contador y botones para interactuar.
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Se inyecta el BLoC utilizando get_it y BlocProvider.
    return BlocProvider(
      create: (_) => sl<CounterBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Contador - Clean Architecture')),
        body: Center(
          child: BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is CounterError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is CounterLoading) {
                return const CircularProgressIndicator();
              } else if (state is CounterLoaded) {
                return Text('Valor: ${state.value}',
                    style: const TextStyle(fontSize: 24));
              }
              // Estado inicial o cualquier otro estado
              return const Text('Valor: 0', style: TextStyle(fontSize: 24));
            },
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: () {
                    // Este context está dentro del BlocProvider
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
