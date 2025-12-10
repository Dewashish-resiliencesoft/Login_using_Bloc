import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test_bloc/App/Bloc/authbloc/auth_bloc.dart';
import 'package:login_test_bloc/App/Pages/homepage_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthBloc())],
      child: const MaterialApp(
        title: "Authentication Using BLOC",
        debugShowCheckedModeBanner: false,
        home: HomepageView(),
      ),
    );
  }
}
