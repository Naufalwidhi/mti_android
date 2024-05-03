// import 'dart:convert';

// class UserModel {
//   UserModel({
//     required this.code,
//     required this.status,
//     required this.message,
//   });

//   final int code;
//   final bool status;
//   final dynamic message;

//   factory UserModel.fromJson(dynamic str) =>
//       UserModel.fromMap(json.decode(str));

//   factory UserModel.fromMap(Map<dynamic, dynamic> json) => UserModel(
//         code: json["code"],
//         status: json["status"],
//         message: json["message"],
//       );
// }