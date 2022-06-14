import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:login_bloc/todos_list/stats/bloc/stats_bloc.dart';
import '../../../packages/todos_repository/todos_repository.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StatsBloc(todosRepository: context.read<TodosRepository>())
            ..add(
              const StatsSubscriptionRequested(),
            ),
      child: const StatsView(),
    );
  }
}

class StatsView extends StatelessWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<StatsBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísticas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            key: const Key('statsView_completedTodos_listTile'),
            leading: const Icon(Icons.check_rounded),
            title: const Text('TODOs completas'),
            trailing: Text('${state.completedTodos}'),
          ),
        ],
      ),
    );
  }
}
