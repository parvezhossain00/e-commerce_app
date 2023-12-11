
import 'package:e_shop/widgets/token_shareprefe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/log_in_controller.dart';
import 'home_page/home_page.dart';
import 'login_singup_page/log_in_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
//i love you
class MyApp extends StatelessWidget {
  LogInController logInController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        // Using a ternary operator to conditionally choose the initial page
        home: FutureBuilder(
          future: TokenSharePrefences.loadToken(),
          builder: (context, snapshot) {
            if(snapshot.data == null){
              return LogInPage();
            }
            else{
              return HomePage();
            }
          },
        )
    );
  }
}
