import '../../../../utlis/secure_storage.dart';
import 'login_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey= GlobalKey<FormState>();
  final request =LoginRequest();


  @override
  void didUpdateWidget(LoginScreen oldWidget){
    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState(){
    super.initState();
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        SystemNavigator.pop(); // Exit app
      },
      child: BlocConsumer<LoginBloc,LoginState>(
        listener: (BuildContext context, state) {
          if(state is LoginLoadingState){
            AppLoader.show(context);
          }
          if(state is LoginSuccessState){
            AppLoader.hide();
            SecureStorageService.saveValue(SecureStorageService.tokenKey, state.response.data!.token!);
            Fluttertoast.showToast(msg: state.response.message??"");
            context.push(Routes.dashboard);

          }
          if(state is LoginErrorState){
            AppLoader.hide();
            Fluttertoast.showToast(msg: state.msg);
          }
        },
        builder: (context,state) {
          return Scaffold(
            appBar: AppBar(
            automaticallyImplyLeading: false,
              title: Text("Login Screen",),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                   Text("Please login to continue...",
                       style: TextStyle(fontSize: 20)),
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
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(Colors.blue)
                              ),
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  context.read<LoginBloc>().add(SubmitEvent(request));
                                }
                              },
                              child: Text("Login",style: TextStyle(color: Colors.white),)
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
