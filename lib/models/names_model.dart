import 'dart:convert';

List<String> namesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String namesToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
