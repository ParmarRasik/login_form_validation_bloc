import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_validation_bloc/login/bloc/login_bloc.dart';
import 'package:login_form_validation_bloc/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CupertinoButton(
                  color: Colors.green,
                  child: const Text("Login"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => LoginBloc(),
                                  child: LoginScreen(),
                                )));
                  }),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoButton(color: Colors.green, child: const Text("Sign in"), onPressed: () {}),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
