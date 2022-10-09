import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'inputfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import '../controllers/googlesignin.dart';

class LoginFields extends StatelessWidget {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  VoidCallback changetoRegister;

  LoginFields(
      {super.key,
      required this.loginEmailController,
      required this.loginPasswordController,
      required this.changetoRegister});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: SlideAnimation(
        verticalOffset: -160,
        child: FadeInAnimation(
          duration: Duration(seconds: 1),
          child: Column(children: [
            Row(
              children: [
                InputField(
                  false,
                  hint: AppLocalizations.of(context)!.emailInput,
                  txController: loginEmailController,
                  leadingicon: const Icon(Icons.mark_email_read),
                )
              ],
            ),
            Row(
              children: [
                InputField(
                  true,
                  hint: AppLocalizations.of(context)!.password,
                  txController: loginPasswordController,
                  leadingicon: const Icon(Icons.password_rounded),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white.withOpacity(0.8))),
                        onPressed: () {
                          if (loginEmailController.text.isNotEmpty) {
                            if (loginPasswordController.text.isNotEmpty) {
                              if (loginEmailController.text.contains('@')) {
                                if (loginPasswordController.text.length >= 6) {
                                  // Do Login

                                  doLogin();
                                } else {
                                  AnimatedSnackBar.material(
                                    AppLocalizations.of(context)!.shortpass,
                                    type: AnimatedSnackBarType.error,
                                  ).show(context);
                                }
                              } else {
                                AnimatedSnackBar.material(
                                  AppLocalizations.of(context)!.invalidmail,
                                  type: AnimatedSnackBarType.error,
                                ).show(context);
                              }
                            } else {
                              AnimatedSnackBar.material(
                                AppLocalizations.of(context)!.emptypass,
                                type: AnimatedSnackBarType.error,
                              ).show(context);
                            }
                          } else {
                            AnimatedSnackBar.material(
                              AppLocalizations.of(context)!.emptymail,
                              type: AnimatedSnackBarType.error,
                            ).show(context);
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.loginbutton)),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white.withOpacity(0.8))),
                        onPressed: signInWithGoogle,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              scale: 3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(AppLocalizations.of(context)!.loginwithG)
                          ],
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.noAccount,
                            style: const TextStyle(fontSize: 15)),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            changetoRegister();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.registerText,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void doLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
