import 'dart:convert';

ExampleModelRequest exampleModelRequestFromJson(String str) =>
    ExampleModelRequest.fromJson(json.decode(str));

String exampleModelRequestToJson(ExampleModelRequest data) =>
    json.encode(data.toJson());

class ExampleModelRequest {
  String? status;

  ExampleModelRequest({
    this.status,
  });

  factory ExampleModelRequest.fromJson(Map<String, dynamic> json) =>
      ExampleModelRequest(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
