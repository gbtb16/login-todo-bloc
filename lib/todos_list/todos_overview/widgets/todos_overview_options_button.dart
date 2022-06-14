import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:login_bloc/todos_list/todos_overview/bloc/todos_overview_bloc.dart';

enum TodosOverviewOptions { toggleAll, clearCompleted }

class TodosOverviewOptionsButton extends StatelessWidget {
  const TodosOverviewOptionsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.select((TodosOverviewBloc bloc) => bloc.state.todos);
    final hasTodos = todos.isNotEmpty;
    final completedTodosAmount = todos.where((todo) => todo.isCompleted).length;

    return PopupMenuButton<TodosOverviewOptions>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      tooltip: 'Options',
      onSelected: (options) {
        switch (options) {
          case TodosOverviewOptions.toggleAll:
            context
                .read<TodosOverviewBloc>()
                .add(const TodosOverviewToggleCompleteAllRequested());
            break;
          case TodosOverviewOptions.clearCompleted:
            context
                .read<TodosOverviewBloc>()
                .add(const TodosOverviewClearCompletedRequested());
            break;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: TodosOverviewOptions.toggleAll,
            enabled: hasTodos,
            child: Text(
              completedTodosAmount == todos.length
                  ? 'Marcar todos como incompleto'
                  : 'Marcar todos como completo',
            ),
          ),
          PopupMenuItem(
            value: TodosOverviewOptions.clearCompleted,
            enabled: hasTodos && completedTodosAmount > 0,
            child: const Text('Limpar completos'),
          ),
        ];
      },
      icon: const Icon(Icons.more_vert_rounded),
    );
  }
}
