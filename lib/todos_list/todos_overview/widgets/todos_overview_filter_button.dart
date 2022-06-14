import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

import 'package:login_bloc/todos_list/todos_overview/bloc/todos_overview_bloc.dart';

class TodosOverviewFilterButton extends StatelessWidget {
  const TodosOverviewFilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeFilter = context.select(
      (TodosOverviewBloc bloc) => bloc.state.filter,
    );

    return PopupMenuButton<TodosViewFilter>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      initialValue: activeFilter,
      tooltip: 'Filtro',
      onSelected: (filter) {
        context
            .read<TodosOverviewBloc>()
            .add(TodosOverviewFilterChanged(filter: filter));
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: TodosViewFilter.all,
            child: Text('Todos'),
          ),
          const PopupMenuItem(
            value: TodosViewFilter.activeOnly,
            child: Text('Ativos'),
          ),
          const PopupMenuItem(
            value: TodosViewFilter.completedOnly,
            child: Text('Completos'),
          ),
        ];
      },
      icon: const Icon(Icons.filter_list_rounded),
    );
  }
}
