import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_with_flutter/domain/services/apiClient/apiClient.dart';
import 'package:go_with_flutter/presentation/view/auth/login/bloc/event.dart';
import 'package:go_with_flutter/presentation/view/auth/login/bloc/state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final ApiClient client;
  LoginBloc(this.client) : super(LoginInitialState()){
    on<SubmitEvent>(_login);
  }

  FutureOr<void> _login(SubmitEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try{
      final response=await client.login(event.request);
      if(response.success==true){
        emit(LoginSuccessState(response));
      }
      else{
        emit(LoginErrorState(response.message??""));
      }

    }on DioException catch(e){
        emit(LoginErrorState( e.error?.toString() ??
            e.message ??
            "Something went wrong",));

    }catch(e){
      emit(LoginErrorState("Unexpected error"));
    }
  }
}
