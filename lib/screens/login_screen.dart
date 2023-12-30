import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/button/button_login_widget.dart';
import '../widgets/text_form_field/text_form_field_email_widget.dart';
import '../widgets/text_form_field/text_form_field_password_widget.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool btnLoading = false;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFF800B),
                  Color(0xFFFF800B),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/coffee.png",
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                const Spacer(),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 32, right: 32),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 62),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  children: <Widget>[
                    TextFormFieldEmailWidget(
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormFieldPasswordWidget(
                      controller: passwordController,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 4.0, right: 0.0),
                        child: InkWell(
                          highlightColor: Colors.grey,
                          onTap: () {
                            print('Esqueceu a conta?');
                          },
                          child: const Text(
                            'Esqueceu a conta?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    LoginButtonWidget(
                        onLoginStatus: btnLoading,
                        onLoginPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              btnLoading = true;
                            });
                            Timer(
                              const Duration(seconds: 10),
                              () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return const HomeScreen(
                                        title: 'Home Screen');
                                  }),
                                );
                                setState(() {
                                  btnLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 2),
                                    content: const Row(
                                      children: [
                                        Icon(Icons.verified_user_rounded,
                                            color: Colors
                                                .white), // Ícone à esquerda do texto
                                        SizedBox(
                                            width:
                                                8), // Espaçamento entre o ícone e o texto
                                        Text('Usuário logado com sucesso.'),
                                      ],
                                    ),
                                    backgroundColor:
                                        Colors.teal, // Cor de fundo da snackbar
                                    behavior: SnackBarBehavior
                                        .floating, // Comportamento da snackbar
                                    shape: RoundedRectangleBorder(
                                      // Forma da snackbar
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                          color: Colors.teal, width: 2),
                                    ),
                                  ),
                                );
                              },
                            );
                            return;
                          }
                          btnLoading = false;
                        }),
                    /*InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Login'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
