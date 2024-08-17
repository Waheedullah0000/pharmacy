// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorEntity _$DoctorEntityFromJson(Map<String, dynamic> json) => DoctorEntity(
      image: json['image'] as String?,
      doctorId: json['doctorId'] as String?,
      doctorName: json['doctorName'] as String?,
      doctorSkills: json['doctorSkills'] as String?,
      awayLocation: json['awayLocation'] as String?,
      aboutForDoctor: json['aboutForDoctor'] as String?,
    );

Map<String, dynamic> _$DoctorEntityToJson(DoctorEntity instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'image': instance.image,
      'doctorName': instance.doctorName,
      'doctorSkills': instance.doctorSkills,
      'awayLocation': instance.awayLocation,
      'aboutForDoctor': instance.aboutForDoctor,
    };
