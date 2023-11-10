import 'dart:convert';

class UserDataModel {
  String storedData;
  UserDataModel({required this.storedData});
  factory UserDataModel.fromJson(String str) =>
      UserDataModel.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());
  factory UserDataModel.fromMap(Map<String, dynamic> json) =>
      UserDataModel(storedData: json['storedData']);
  Map<String, dynamic> toMap() => {
        "storedData": storedData,
      };
}
