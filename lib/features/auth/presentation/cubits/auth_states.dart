/*

 Auth_states is to outline the different types of states we can have when a user tries to authenticate
 */

import 'package:moonbase/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

//Initial State
class AuthInitial extends AuthState {}

//loading state
class AuthLoading extends AuthState {}

//Authenticated State - which means if they are authenticated, there's gonna be a user that is logged in
class Authenticated extends AuthState {
  final AppUser user;
  Authenticated(this.user);
}

//Unauthenticated State
class Unauthenticated extends AuthState {}

//And lastly an ERROR state
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
