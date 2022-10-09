import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:protecthechain/widgets/loginContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        // Login Container
        Stack(
          fit: StackFit.loose,
          children: [
            Text(
              AppLocalizations.of(context)!.appTitle,
              style: const TextStyle(fontSize: 30, fontFamily: 'Alata'),
            ),
          ],
        ),

        const Center(
          child: LoginContainer(),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.15),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('assets/images/bottom.png',
                height: MediaQuery.of(context).size.height * 0.2),
          ],
        )
      ],
    );
  }
}
