import 'package:flutter/material.dart';

class Chain {
  int id;
  String chainName;
  DateTime chainDate;
  bool isDone;
  int chainRepetition;
  int chainCategory;
  TimeOfDay chainRemindTime;

  Chain(this.id, this.isDone,
      {required this.chainName,
      required this.chainDate,
      required this.chainCategory,
      required this.chainRepetition,
      required this.chainRemindTime});
}
