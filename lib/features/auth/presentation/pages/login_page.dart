/* Login Page UI

ON this page, a user can login with their:
- Email
-Password
----------------------------------------------------
Once the user successfully logs in, they would be directed to the Home page.
If the user doesn't have an account, then we can send them to the Register Page to create one.
 */

import 'package:flutter/material.dart';
import 'package:moonbase/features/auth/presentation/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text controllers
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  //BUILD UI
  @override
  Widget build(BuildContext context) {
    //SCAFFOLD
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: Text("Login"),
      ),
      // BODY OF THE APP

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.lock_open,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(
                height: 25,
              ),

              //name of the app
              Text(
                "M O O N B A S E",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //email textfield
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              //pw textfield
              MyTextfield(
                controller: pwController,
                hintText: "Password",
                obscureText: true,
              ),

              //forgot password

              //login button

              //auth sign in

              //don't have an account? register now!
            ],
          ),
        ),
      ),
    );
  }
}
