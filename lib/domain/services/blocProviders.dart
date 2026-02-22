import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_with_flutter/domain/services/dio.dart';

import '../../presentation/view/auth/registration/bloc/bloc.dart';
import 'apiClient/apiClient.dart';

class AppProviders{
 static final  _registerBloc=BlocProvider<RegistrationBloc>
  (create: (context)=>RegistrationBloc(ApiClient(AppRepository.dio)));

  static final List<BlocProvider> appBlocs=[_registerBloc];
}