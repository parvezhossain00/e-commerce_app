
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/log_in_controller.dart';
import 'sign_up_page.dart';

class LogInPage extends StatelessWidget {
   LogInPage({super.key});
  
  LogInController logInController = Get.put(LogInController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   var isSecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.white,
      body:

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const SizedBox(height: 40,),


                Center(
                  child: Container(
                    height: 230,
                    width: 400,
                    child: Image.asset("assets/login.png",fit: BoxFit.cover,),
                  ),
                ),
                const Text("WelCome",style: TextStyle(fontSize: 40,color: Colors.deepPurple),),
                Text("to E-Shop login",style: TextStyle(
                  fontSize: 16,color: Colors.deepPurple
                ),),
                const SizedBox(height: 40,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: const Text("Enter your email...",style: TextStyle(color: Colors.deepPurple),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13)
                    )
                  ),
                ),


                const SizedBox(height: 30,),
                TextField(
                  controller: passwordController,
                  obscureText: isSecure.value,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isSecure.value = !isSecure.value;
                      },
                      child: Icon(
                        isSecure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

                      label: const Text("Enter you password...",style: TextStyle(color: Colors.deepPurple),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)
                      )
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: (){},
                        child: const Text("Remember me")),
                    TextButton(onPressed: (){
                      Get.to(const SignUpPage());
                    }, child: const Text("Forgot Password",style: TextStyle(color: Colors.red),),
                    )
                  ],
                ),


                ElevatedButton(onPressed: (){
                  _logIn();
                },
                    child: const Text("Log In",style: TextStyle(color:Colors.deepPurpleAccent,fontSize: 18),)),



                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("You don't have an account?",style: TextStyle(color: Colors.purple),),
                    TextButton(onPressed: (){
                      Get.to(const SignUpPage());
                    }, child: const Text("        Sign Up",
                      style: TextStyle(color: Colors.green),),)
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logIn() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    
    logInController.login(email, password);
  }
}
