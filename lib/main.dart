import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_with_flutter/domain/services/appRouter.dart';
import 'package:go_with_flutter/domain/services/blocProviders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.appBlocs,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Go with Flutter',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueAccent,
            iconTheme: IconThemeData(
              color: Colors.white
            ),
            titleTextStyle: TextStyle(color: Colors.white),
          ),
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        )
      ),
    );
  }
}
