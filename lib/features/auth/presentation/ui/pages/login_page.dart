import 'package:desafio_dixbpo/config/app_extensions.dart';
import 'package:desafio_dixbpo/features/auth/presentation/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).clearFocus();
          },
          child: SafeArea(
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              decoration:  BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        .6874,
                        1
                      ],
                      colors: [
                        theme.colorScheme.onPrimaryContainer,
                        theme.colorScheme.secondaryContainer,


                      ])),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Container(

                    child: Text(
                      "Bid365",
                      style: theme.textTheme.headlineLarge!.copyWith(
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Entrar",
                      style:
                      theme.textTheme.headlineMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "informe os dados para acessar",
                      style: theme.textTheme.titleSmall!.copyWith(
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  const LoginForm(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
