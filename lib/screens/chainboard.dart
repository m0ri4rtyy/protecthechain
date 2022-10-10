import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChainBoard extends StatelessWidget {
  const ChainBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = FirebaseAuth.instance.currentUser;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: (() {
                    FirebaseAuth.instance.signOut();
                  }),
                  icon: Icon(Icons.logout)),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
        });
  }
}
