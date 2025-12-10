import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test_bloc/App/Bloc/authbloc/auth_bloc.dart';
import 'package:login_test_bloc/App/Pages/authpage.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication Using BLOC"),
        actions: <Widget>[
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) =>
                state is Unauthenticatedstate || state is Authfailursetate
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Authpage();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.login_outlined),
                  )
                : IconButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("Logout Successfully"),
                          backgroundColor: Colors.red.shade300,
                        ),
                      );
                    },
                    icon: Icon(Icons.logout),
                  ),
          ),
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Unauthenticatedstate || state is Authfailursetate) {
            return Center(child: Text("Unauthenticated"));
          }
          return Center(child: Text("Homepage"));
        },
      ),
    );
  }
}
