import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticatedstate()) {
    on<LoginEvent>((event, emit) async {
      emit(Loadingstate());
      try {
        final email = event.email;
        final password = event.password;

        if (email.isEmpty || password.isEmpty) {
          return emit(
            Authfailursetate(errorMessage: "email or password cannot be empty"),
          );
        } else if (email.length < 10 || password.length < 6) {
          return emit(
            Authfailursetate(errorMessage: "email or password is too short"),
          );
        } else {
          await Future.delayed(const Duration(seconds: 2), () {
            return emit(Authsuccessstate(uid: "UID-$email-$password"));
          });
        }
      } catch (e) {
        emit(Authfailursetate(errorMessage: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) {
      try {
        emit(Unauthenticatedstate());
      } catch (e) {
        emit(Authfailursetate(errorMessage: e.toString()));
      }
    });
  }
}
