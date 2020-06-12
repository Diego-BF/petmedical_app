import 'package:cloud_firestore/cloud_firestore.dart';

class Vaccination {
  String vaccination;
  DateTime date;
  bool done;

  DocumentReference reference;

  Vaccination(
    this.vaccination, {
      this.date,
      this.done,
      this.reference
    }
  );
  factory Vaccination.fromJson(Map<dynamic, dynamic> json) =>
          _vaccinationFromJson(json);
  Map<String, dynamic> toJson() => _vaccinationToJson(this);
  @override
  String toString() => "Vaccination<$vaccination>";
}

Vaccination _vaccinationFromJson(Map<dynamic, dynamic> json) {
  return Vaccination(
    json['vaccination'] as String,
    date: json['date'] == null ? null : (json['date'] as Timestamp).toDate(),
    done: json['done'] as bool
  );
}

Map<String, dynamic> _vaccinationToJson(Vaccination instance) =>
  <String, dynamic> {
    'vaccination': instance.vaccination,
    'date': instance.date,
    'done': instance.done
  };

