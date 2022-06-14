import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../packages/todos_repository/todos_repository.dart';
import 'package:login_bloc/todos_list/home/view/view.dart';
import '../theme/theme.dart';

class AppTodo extends StatelessWidget {
  final TodosRepository todosRepository;

  const AppTodo({
    Key? key,
    required this.todosRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: todosRepository,
      child: const AppTodoView(),
    );
  }
}

class AppTodoView extends StatelessWidget {
  const AppTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BlocLoginWithTodoTheme.light,
      darkTheme: BlocLoginWithTodoTheme.light,
      home: const HomePage(),
    );
  }
}
