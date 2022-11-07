import 'package:flutter/cupertino.dart';



class Records {

  String title;
  int amount;
  factory Records.fromJson(Map<String, dynamic> json) => Records(
    title: json["title"],
    amount: json["amount"],
  );
  Map<String, dynamic> toJson(){
    return {
      "title": this.title,
      "amount": this.amount,
    };
  }

  Records({
    required this.title,
    required this.amount,
  });

}
