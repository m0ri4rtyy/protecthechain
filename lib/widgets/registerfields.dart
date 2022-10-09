import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'inputfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class RegisterFields extends StatelessWidget {
  TextEditingController registermail = TextEditingController();
  TextEditingController registerpass1 = TextEditingController();
  TextEditingController registerpass2 = TextEditingController();
  VoidCallback changetoLogin;
  RegisterFields({
    super.key,
    required this.registermail,
    required this.registerpass1,
    required this.registerpass2,
    required this.changetoLogin,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: SlideAnimation(
        verticalOffset: 160,
        child: FadeInAnimation(
          duration: const Duration(seconds: 1),
          child: Column(
            children: [
              Row(
                children: [
                  InputField(
                    false,
                    hint: AppLocalizations.of(context)!.emailInput,
                    txController: registermail,
                    leadingicon: const Icon(Icons.mark_email_read),
                  )
                ],
              ),
              Row(
                children: [
                  InputField(
                    true,
                    hint: AppLocalizations.of(context)!.password,
                    txController: registerpass1,
                    leadingicon: const Icon(Icons.password_rounded),
                  )
                ],
              ),
              Row(
                children: [
                  InputField(
                    true,
                    hint: AppLocalizations.of(context)!.confirmPassword,
                    txController: registerpass2,
                    leadingicon: const Icon(Icons.password_rounded),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white.withOpacity(0.8))),
                          onPressed: () {
                            if (registermail.text.isNotEmpty) {
                              if (registerpass1.text.isNotEmpty) {
                                if (registermail.text.contains('@')) {
                                  if (registerpass1.text.length >= 6) {
                                    if (registerpass1.text ==
                                        registerpass2.text) {
                                      doRegister(context);
                                    } else {
                                      AnimatedSnackBar.material(
                                        AppLocalizations.of(context)!
                                            .passnotmatch,
                                        type: AnimatedSnackBarType.error,
                                      ).show(context);
                                    }
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
                          child:
                              Text(AppLocalizations.of(context)!.registerText)),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.yesAccount),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: changetoLogin,
                      child: Text(AppLocalizations.of(context)!.loginText,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doRegister(ctx) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registermail.text,
        password: registerpass1.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        AnimatedSnackBar.material(
          AppLocalizations.of(ctx)!.mailinuse,
          type: AnimatedSnackBarType.error,
        ).show(ctx);
      }
    } catch (e) {
      print(e);
    }
  }
}
