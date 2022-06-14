import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer';
import 'dart:async';

import 'package:login_bloc/todos_list/app/app_bloc_observer.dart';
import '../packages/todos_repository/todos_repository.dart';
import 'package:login_bloc/todos_list/app/app_todo.dart';
import '../packages/todos_api/todos_api.dart';

void bootstrap({required TodosApi todosApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final todosRepository = TodosRepository(todosApi: todosApi);

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          AppTodo(todosRepository: todosRepository),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
