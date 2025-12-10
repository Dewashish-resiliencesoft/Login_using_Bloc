part of '../authbloc/auth_bloc.dart';

sealed class AuthState {}

class Unauthenticatedstate extends AuthState {}

class Loadingstate extends AuthState {}

class Authsuccessstate extends AuthState {
  final String uid;

  Authsuccessstate({required this.uid});
}

class Authfailursetate extends AuthState {
  final String errorMessage;

  Authfailursetate({required this.errorMessage});
}
