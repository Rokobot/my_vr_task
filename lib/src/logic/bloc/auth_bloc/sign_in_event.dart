part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}


class GetTokenEvent extends SignInEvent{
  final BuildContext context;
  final String userName;
  final String userEmail;
  final String userPassword;
  GetTokenEvent({ required this.context, required this.userEmail, required this.userName ,required this.userPassword});

  @override
  List<Object?> get props => [ context, userEmail, userPassword];
}