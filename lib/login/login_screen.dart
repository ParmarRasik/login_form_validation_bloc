import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_validation_bloc/login/bloc/login_bloc.dart';
import 'package:login_form_validation_bloc/login/bloc/login_event.dart';
import 'package:login_form_validation_bloc/login/bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Login", style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              if (state is LoginErrorState) {
                return Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.red),
                );
              }
              return Container();
            }),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: emailController,
              onChanged: (value) {
                BlocProvider.of<LoginBloc>(context).add(LoginTextChangeEvent(emailController.text, passwordController.text));
              },
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              onChanged: (value) {
                BlocProvider.of<LoginBloc>(context).add(LoginTextChangeEvent(emailController.text, passwordController.text));
              },
              decoration: const InputDecoration(hintText: "Password"),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                if (state is LoginLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                    color: (state is LoginValidState) ? Colors.green : Colors.grey,
                    child: const Text("Login"),
                    onPressed: () {
                      if (state is LoginValidState) {
                        BlocProvider.of<LoginBloc>(context).add(LoginSubmittedEvent(emailController.text, passwordController.text));
                      }
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}

extension StringValidator on String {
  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
