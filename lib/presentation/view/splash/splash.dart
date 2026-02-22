import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_with_flutter/domain/services/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _navigateToRegistration(){
    Future.delayed(Duration(seconds: 5),(){
      if(!mounted) return;
      context.push(Routes.register);
    });
  }
  @override
  void initState(){
    super.initState();
    _navigateToRegistration();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Text("Please wait while we are redirecting you to the registration screen...",textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
