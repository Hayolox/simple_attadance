import 'dart:convert';

ExampleModelResponse exampleModelResponseFromJson(String str) =>
    ExampleModelResponse.fromJson(json.decode(str));

String exampleModelResponseToJson(ExampleModelResponse data) =>
    json.encode(data.toJson());

class ExampleModelResponse {
  String? code;
  String? message;
  List<dynamic>? data;

  ExampleModelResponse({
    this.code,
    this.message,
    this.data,
  });

  factory ExampleModelResponse.fromJson(Map<String, dynamic> json) =>
      ExampleModelResponse(
        code: json["code"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
