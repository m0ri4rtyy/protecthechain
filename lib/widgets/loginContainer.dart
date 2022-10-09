import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:protecthechain/widgets/loginfields.dart';

import './inputfield.dart';
import 'registerfields.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  bool containerState = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController loginEmailController = TextEditingController();
    TextEditingController loginPassController = TextEditingController();
    TextEditingController registerEmailController = TextEditingController();
    TextEditingController registerPassController = TextEditingController();
    TextEditingController registerPassController2 = TextEditingController();

    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset.zero,
                blurRadius: 30,
                spreadRadius: 0,
                blurStyle: BlurStyle.outer)
          ],
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.withOpacity(0.5),
                Colors.blue.withOpacity(0.5),
              ]),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        if (!containerState)
          LoginFields(
            loginEmailController: loginEmailController,
            loginPasswordController: loginPassController,
            changetoRegister: changeState,
          ),
        if (containerState)
          RegisterFields(
            registermail: registerEmailController,
            registerpass1: registerPassController,
            registerpass2: registerPassController2,
            changetoLogin: changeState,
          )
      ]),
    );
  }

  void doRegister() {}

  void changeState() {
    setState(() {
      containerState = !containerState;
    });
  }
}
