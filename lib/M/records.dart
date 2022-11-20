import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Records> RecordsFromJson(String str) =>
    List<Records>.from(json.decode(str).map((x) => Records.fromJson(x)));



class Records {

  String title;
  int amount;
  String date;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
    title: json["title"],
    amount: json["amount"],
    date: json["date"],
  );

  Map<String, dynamic> toJson(){
    return {
      "title": this.title,
      "amount": this.amount,
      "date": this.date,
    };
  }

  Records({
    required this.title,
    required this.amount,
    required this.date,
  });

}
