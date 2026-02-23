import 'dashboard_import.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome to dashboard"),
        actions: [
          IconButton(onPressed: (){
            AppLoader.show(context);
            SecureStorageService.clearData();
            AppLoader.hide();
            context.go(Routes.login);
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
}
