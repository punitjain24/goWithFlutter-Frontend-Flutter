import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_with_flutter/domain/services/apiClient/apiClient.dart';
import 'package:go_with_flutter/presentation/view/auth/registration/bloc/state.dart';

import 'event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final ApiClient client;
  RegistrationBloc(this.client): super(RegistrationInitialState()){
    on<SubmitEvent>(_submitEvent);
}
  FutureOr<void> _submitEvent( SubmitEvent event, Emitter<RegistrationState> emit,) async {
    emit(RegistrationLoadingState());
    try{
      final response=await client.registerUser(event.request);
      if(response.success==true){
        emit(RegistrationSuccessState(response));
      }else{
        emit(RegistrationErrorState(response.message.toString()));
      }
    }on DioException catch(e){
      if(e.response!=null){
        emit(RegistrationErrorState(e.response!.data["message"].toString()));
      }
      else {
        emit(
          RegistrationErrorState("No internet connection"),
        );
      }
    }catch(e){
      emit(RegistrationErrorState(
        "Unexpected error occurred",
      ));
    }
  }
}

