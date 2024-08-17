import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_entity.g.dart';
@JsonSerializable()
class DoctorEntity{
  final String? doctorId;
  final String? image;
  final String? doctorName;
  final String? doctorSkills;
  final String? awayLocation;
  final String? aboutForDoctor;

  DoctorEntity({
    this.image,
    this.doctorId,
    this.doctorName,
    this.doctorSkills,
    this.awayLocation,
    this.aboutForDoctor,
  });
  factory DoctorEntity.fromJson(Map<String, dynamic> json) => _$DoctorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorEntityToJson(this);

  static CollectionReference<DoctorEntity> collection() {
    return FirebaseFirestore.instance.collection('doctor').withConverter<DoctorEntity>(
        fromFirestore: (snapshot, _) => DoctorEntity.fromJson(snapshot.data()!),
        toFirestore: (question, _) => question.toJson());
  }

  static DocumentReference<DoctorEntity> doc({required String doctorId}) {
    return FirebaseFirestore.instance.doc('doctor/$doctorId').withConverter<DoctorEntity>(
        fromFirestore: (snapshot, _) => DoctorEntity.fromJson(snapshot.data()!),
        toFirestore: (question, _) => question.toJson());
  }
}
