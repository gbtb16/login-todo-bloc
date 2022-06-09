import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:login_bloc/bloc/authentication_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Dashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                final userId = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.id,
                );
                return Text('User ID: $userId');
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                      AuthenticationLogoutRequested(),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
