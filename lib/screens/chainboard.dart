import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChainBoard extends StatelessWidget {
  const ChainBoard({super.key});

  @override
  Widget build(BuildContext context) {
    double getHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    final userData = FirebaseAuth.instance.currentUser;
    return Container(
      child: Column(
        children: [
          Container(
            height: getHeight * 0.077,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: Text(
                    AppLocalizations.of(context)!.appTitle,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                      onPressed: (() {
                        FirebaseAuth.instance.signOut();
                      }),
                      icon: Icon(Icons.logout)),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.indigo.shade100,
            height: getHeight * 0.874,
          ),
          Stack(
            children: [
              Expanded(
                  child: Container(
                color: Colors.white,
                height: getHeight * 0.1,
              )),
              Row(
                children: [
                  Image.asset(
                    color: Colors.indigo,
                    'assets/icons/link.png',
                    width: 35,
                  ),
                  Image.asset(
                    color: Colors.indigo,
                    'assets/icons/link.png',
                    width: 35,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
