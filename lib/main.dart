import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:login_bloc/app.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'packages/local_storage_todos_api/local_storage_todos_api.dart';
import 'package:login_bloc/todos_list/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final todosApi = LocalStorageTodosApi(
    plugin: await SharedPreferences.getInstance(),
  );

  bootstrap(todosApi: todosApi);

  runApp(
    App(
      authenticationRepository: AuthenticationRepository(), // create new stream
      userRepository: UserRepository(),
      todosApi: todosApi, // create new stream
    ),
  );
}
