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
      final response=await client.register(event.request);
      if(response.success==true){
        emit(RegistrationSuccessState(response));
      }else{
        emit(RegistrationErrorState(response.message.toString()));
      }
    }on DioException catch(e){
      emit(RegistrationErrorState( e.error?.toString() ??
          e.message ??
          "Something went wrong",));

    }catch(e){
      emit(RegistrationErrorState(
        "Unexpected error occurred",
      ));
    }
  }
}

