part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}


class SignInStateSucces extends SignInState{

  @override
  List<Object?> get props => [];
}

class LoadingState extends SignInState{
  final bool loading;

  LoadingState({required this.loading});

  @override
  List<Object?> get props => [loading];
}

class ErrorState extends SignInState{
  final String errror;

  ErrorState({required this.errror});
  @override
  List<Object?> get props=> [errror];
}

