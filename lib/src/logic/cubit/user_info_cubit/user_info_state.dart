part of 'user_info_cubit.dart';

@immutable
class UserInfoState {}

class UserInfoInitial extends UserInfoState {}


class UpdateUserInfoState extends UserInfoState{
  final String? userEmail;
  final String? userName;
  UpdateUserInfoState({required this.userEmail, required this.userName});
  @override
  List<Object?> get props => [userEmail, userName];

}


