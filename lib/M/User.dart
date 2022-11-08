
class UserModel {
  String name;
  int salary;
  String date;
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    salary: json["salary"],
    date: json["date"],
  );
  Map<String, dynamic> toJson(){
    return {
      "name": this.name,
      "salary": this.salary,
      "date": this.date,
    };
  }

  UserModel({
    required this.name,
    required this.salary,
  required this.date,
  });

}