import 'package:login_bloc/todos_list/stats/view/stats_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:login_bloc/todos_list/todos_overview/view/todos_overview_page.dart';
import 'package:login_bloc/todos_list/edit_todo/view/edit_todo_page.dart';
import 'package:login_bloc/todos_list/home/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          TodosOverviewPage(),
          StatsPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        key: const Key('homeView_addTodo_floatingActionButton'),
        onPressed: () => Navigator.of(context).push(EditTodoPage.route()),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.todos,
              icon: const Icon(Icons.list),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.stats,
              icon: const Icon(Icons.show_chart_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  const _HomeTabButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      icon: icon,
      iconSize: 32,
      constraints: const BoxConstraints(
        minHeight: 32,
      ),
      color:
          groupValue != value ? null : Theme.of(context).colorScheme.secondary,
    );
  }
}
