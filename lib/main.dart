import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:developer' as logDev;

void main() {
  runApp(const MyApp());
}

class APIResponse {
  APIResponse({required this.status, required this.data});
  final String status;
  final Data data;

  factory APIResponse.fromJSON(Map<String, dynamic> json) =>
      APIResponse(status: json['status'], data: Data.fromJSON(json['data']));

  Map<String, dynamic> toJSON() => {
        "status": status,
        'data': data.toJSON(),
      };
}

class Data {
  Data({required this.resultType, required this.result});
  final String resultType;
  final List<Result> result;

  factory Data.fromJSON(Map<String, dynamic> json) => Data(
        resultType: json["resultType"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJSON(x))),
      );

  Map<String, dynamic> toJSON() => {
        "resultType": resultType,
        "result": List<dynamic>.from(result.map((x) => x.toJSON())),
      };
}

class Result {
  Result({required this.metric, required this.value});
  final Metric metric;
  final List<dynamic> value;

  factory Result.fromJSON(Map<String, dynamic> json) => Result(
      metric: Metric.fromJSON(json['metric']),
      value: List<dynamic>.from(json['value'].map((value) => value)));

  Map<String, dynamic> toJSON() => {
        'metric': metric.toJSON(),
        'value': value,
      };
}

class Metric {
  Metric(
      {required this.name,
      required this.area,
      required this.id,
      required this.instance,
      required this.job});

  final String name;
  final String area;
  final String id;
  final String instance;
  final String job;

  factory Metric.fromJSON(Map<String, dynamic> json) => Metric(
      name: json['__name__'],
      area: json['area'],
      id: json['id'],
      instance: json['instance'],
      job: json['job']);

  Map<String, dynamic> toJSON() => {
        '__name__': name,
        'area': area,
        'id': id,
        'instance': instance,
        'job': job,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    logDev.log("Message", name: "LOG1");
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Load JSON File',
      home: MyHomePage(),
    );
  }
}
