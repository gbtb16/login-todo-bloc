import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../packages/todos_repository/todos_repository.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  final TodosRepository todosRepository;

  const App({
    Key? key,
    required this.todosRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: todosRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BlocLoginWithTodoTheme.light,
      darkTheme: BlocLoginWithTodoTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegate,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomePage(),
    );
  }
}
