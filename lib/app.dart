import 'package:login_bloc/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:login_bloc/todos_list/app/app_todo.dart';

import 'package:authentication_repository/authentication_repository.dart';
import './packages/local_storage_todos_api/local_storage_todos_api.dart';
import 'package:login_bloc/screens/splash/splash.dart';
import 'package:user_repository/user_repository.dart';
import '../../../packages/todos_repository/todos_repository.dart';
import 'package:login_bloc/login/view/login.dart';
import 'todos_list/theme/theme.dart';

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final LocalStorageTodosApi todosApi;

  const App({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
    required this.todosApi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodosRepository todosRepository = TodosRepository(todosApi: todosApi);

    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: authenticationRepository,
          ),
          RepositoryProvider.value(
            value: todosRepository,
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final navigatorKey = GlobalKey<NavigatorState>();

  // ignore: unused_element
  NavigatorState get _navigator => navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Login Bloc',
      theme: BlocLoginWithTodoTheme.light,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  MaterialPageRoute<void>(
                    builder: (_) => AppTodo(
                      todosRepository: context.read<TodosRepository>(),
                    ),
                  ),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                    LoginPage.route(), (route) => false);
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
