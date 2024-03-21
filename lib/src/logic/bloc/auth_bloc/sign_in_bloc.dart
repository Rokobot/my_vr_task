import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_app/src/service/rest_service.dart';
import 'package:task_app/src/utils/extentions/auth_extentions.dart';

import '../../../utils/helper_functions/hive_local_storage.dart';
import '../../../utils/helper_functions/token_secure_storage.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<GetTokenEvent>(SignInEventMethod);
  }


  void SignInEventMethod(GetTokenEvent event, Emitter<SignInState> emit){

    ///Extentions to check credental info
    emit(LoadingState(loading: true));
    if(event.userName.isValidUserName){
      if(event.userEmail.isValidEmail){
        if(event.userPassword.isValidPassword){
          emit(LoadingState(loading: false));
          emit(SignInStateSucces());
          HiveLocalStorage().hiveWrite(event.userEmail, event.userName);
          DioService().getTokenWithLogin(event.context);
        }else{
          emit(ErrorState(errror: 'Let it be more than 6'));
        }
      }else{
        emit(ErrorState(errror: 'Write to gmail according to norms'));
      }
    }else{
      emit(ErrorState(errror: 'Your name should be longer than 4'));
    }


  }
}
