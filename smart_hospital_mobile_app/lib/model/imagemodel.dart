// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.doctors,
  });

  List<Doctor> doctors;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        doctors:
            List<Doctor>.from(json["doctor"].map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "doctor": List<dynamic>.from(doctors.map((x) => x.toJson())),
      };
}

class Doctor {
  Doctor({
    required this.doctorId,
    required this.doctorImage,
    required this.status,
    required this.mobileNumber,
    required this.specialist,
    required this.doctorName,
  });

  int doctorId;
  String doctorImage;
  String status;
  int mobileNumber;
  String specialist;
  String doctorName;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        doctorId: json["doctor_id"],
        doctorImage: json["doctor_image"],
        status: json["status"],
        mobileNumber: json["mobile_number"],
        specialist: json["specialist"],
        doctorName: json["doctor_name"],
      );

  Map<String, dynamic> toJson() => {
        "doctor_id": doctorId,
        "doctor_image": doctorImage,
        "status": status,
        "mobile_number": mobileNumber,
        "specialist": specialist,
        "doctor_name": doctorName,
      };
}
