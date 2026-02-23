import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_with_flutter/domain/services/routes.dart';

import '../../../utlis/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _navigateToRegistration()async{
    final token = await SecureStorageService.getValue(SecureStorageService.tokenKey);
    Future.delayed(Duration(seconds: 3),(){
      if(!mounted) return;
      if (token!=null){context.push(Routes.dashboard);}
      else{context.push(Routes.register);}

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
      body: SizedBox(
        width: MediaQuery.of(context).size.width*1,
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text("Please wait while we are redirecting you...",),
            SizedBox(height: 10,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
