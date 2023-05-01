import 'dart:convert';

Historydata historydataFromJson(String str) =>
    Historydata.fromJson(json.decode(str));

String historydataToJson(Historydata data) => json.encode(data.toJson());

class Historydata {
  List<Check> check;

  Historydata({
    required this.check,
  });

  factory Historydata.fromJson(Map<String, dynamic> json) => Historydata(
        check: List<Check>.from(json["check"].map((x) => Check.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "check": List<dynamic>.from(check.map((x) => x.toJson())),
      };
}

class Check {
  // int historyId;
  String specialist;
  String doctorName;
  DateTime date;
  String name;
  // int patientId;

  Check({
    // required this.historyId,
    required this.specialist,
    required this.doctorName,
    required this.date,
    required this.name,
    // required this.patientId,
  });

  factory Check.fromJson(Map<String, dynamic> json) => Check(
        // historyId: json["history_id"],
        specialist: json["specialist"],
        doctorName: json["doctor_name"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        // patientId: json["patient_id"],
      );

  Map<String, dynamic> toJson() => {
        // "history_id": historyId,
        "specialist": specialist,
        "doctor_name": doctorName,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        // "patient_id": patientId,
      };
}
