import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';

import 'packages/local_storage_todos_api/local_storage_todos_api.dart';
import 'package:login_bloc/todos_list/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final todosApi = LocalStorageTodosApi(
    plugin: await SharedPreferences.getInstance(),
  );

  bootstrap(todosApi: todosApi);
}
