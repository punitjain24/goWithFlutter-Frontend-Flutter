import 'package:flutter/gestures.dart';

import 'register_imports.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey= GlobalKey<FormState>();
  final request = RegistrationRequest();
  final TapGestureRecognizer _recognizer=TapGestureRecognizer();
  @override
  void initState(){
    super.initState();
    _recognizer.onTap=(){
      context.push(Routes.login);
    };

  }

  @override
  void dispose(){
    super.dispose();
    _recognizer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc,RegistrationState>(
      builder: (BuildContext context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            SystemNavigator.pop(); // Exit app
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("Registration Screen",)),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      const Text("Please fill this form to continue...",
                        style: TextStyle(fontSize: 20),),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your first name",
                        labelText: "First Name",
                        keyboardType: TextInputType.text,
                        validator: (val){
                          if(val==""){
                            return "Please enter your first name";
                          }
                          return null;
                        },
                        onChanged: (val){
                          request.first_name=val;
                        },
                      ),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your last name",
                        labelText: "Last Name",
                        keyboardType: TextInputType.text,
                        validator: (val){
                          if(val==""){
                            return "Please enter your last name";
                          }
                          return null;
                        },
                        onChanged: (val){
                          request.last_name=val;
                        },
                      ),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your City",
                        labelText: "City",
                        validator: (val){
                          if(val==""){
                            return "Please enter your city";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (val){
                          request.city=val;
                        },
                      ),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your state",
                        labelText: "State",
                        validator: (val){
                          if(val==""){
                            return "Please enter your state";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (val){
                          request.state=val;
                        },
                      ),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your country",
                        labelText: "Country",
                        validator: (val){
                          if(val==""){
                            return "Please enter your country";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (val){
                          request.country=val;
                        },
                      ),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your password",
                        labelText: "Password",
                        validator: (val){
                          if(val==""){
                            return "Please enter your password";
                          }else if(val!.length<6){
                            return "Password must be at least 6 characters";
                          }
                          else if(val.length>16){
                            return "Password must be less than 16 characters";
                          }
                          else if(val.contains(" ")){
                            return "Password must not contain spaces";
                          }
                          return null;
                        },
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        onChanged: (val){
                          request.password=val;
                        },
                      ),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your confirm password",
                        labelText: "Confirm Password",
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (val){
                          if(val==""){
                            return "Please enter your confirm password";
                          }else if(val!.length<6){
                            return "Password must be at least 6 characters";
                          }
                          else if(val.length>16){
                            return "Password must be less than 16 characters";
                          }
                          else if(val.contains(" ")){
                            return "Password must not contain spaces";
                          }
                          else if (val!=request.password){
                            return "Please check password and confirm password";
                          }
                          return null;
                        },
                        onChanged: (val){
                          request.confirm_password=val;
                        },
                      ),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your mobile number",
                        labelText: "Mobile Number",
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        validator: (val){
                          if(val==""){
                            return "Please enter your mobile number";
                          }else if(val!.length<10){
                            return "Please enter valid mobile number";
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (val){
                          request.mobile_number=val;
                        },
                      ),
                      SizedBox(height: 20,),
                      CustomTextFormField(
                        hintText: "Please enter your email",
                        labelText: "Email",
                        validator: (val){
                          if(val==""){
                            return "Please enter your email";
                          }
                          else if(!AppConstant.emailRegex.hasMatch(val!)){
                            return "Please enter valid email address";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val){
                          request.email=val;
                        },
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(Colors.blue)
                              ),
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  context.read<RegistrationBloc>().
                                  add(SubmitEvent(request));
                                }
                              },
                              child: Text("Submit",style: TextStyle(color: Colors.white),)
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Center(
                        child: RichText(
                            text:TextSpan(
                              text: "Already Register ? ",
                              style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: "Click here to Login",
                                      style: TextStyle(color: Colors.blue),
                                     recognizer:_recognizer
                                  )
                                ]

                            ),
                        ),
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }, listener: (BuildContext context, state) {
        if(state is RegistrationLoadingState){
          AppLoader.show(context);
        }
        if(state is RegistrationSuccessState){
          AppLoader.hide();
          Fluttertoast.showToast(msg: state.response.message??"");
          context.push(Routes.login);
        }
        if(state is RegistrationErrorState){
          AppLoader.hide();
          Fluttertoast.showToast(msg: state.error);
        }
    },

    );
  }
}
