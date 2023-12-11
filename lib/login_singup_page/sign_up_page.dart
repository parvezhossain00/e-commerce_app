
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sign_up_controller.dart';
import 'log_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();
  var isSecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 180,
                    width: 250,
                    child: Image.asset("assets/singup.png"),
                  ),
                ),
            
                // const SizedBox(height: 120),
                const Text("Welcome", style: TextStyle( color:Colors.teal,fontSize: 30),),
                Text("to E-shop Singin",style: TextStyle(color: Colors.teal,fontSize: 16),),
                const SizedBox(height: 50,),
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: "Enter your name...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Enter your email...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() => TextFormField(
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
                    labelText: "Enter your password...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )),
                const SizedBox(height: 16),
                Obx(() => TextFormField(
                  controller: confirmationController,
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
                    labelText: "Confirm your password...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    signUpController.CreateUser(
                      userNameController.text,
                      emailController.text,
                      passwordController.text,
                      confirmationController.text,
                    );
                  },
                  child: const Text("SingIn",style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 18),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Already have an account?",
                      style: TextStyle(color: Colors.cyan),),
                    TextButton(onPressed: (){
                      Get.to(LogInPage());
                    }, child: const Text("        Login",
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
}
