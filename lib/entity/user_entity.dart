
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_entity.g.dart';
@JsonSerializable()
class UserEntity {
  String? name;
  String? email;
  String? userId;

  UserEntity({this.name, this.email, this.userId});

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  static CollectionReference<UserEntity> collection() {
    return FirebaseFirestore.instance.collection('userEntity').withConverter<UserEntity>(
        fromFirestore: (snapshot, _) => UserEntity.fromJson(snapshot.data()!),
        toFirestore: (question, _) => question.toJson());
  }

  static DocumentReference<UserEntity> doc({required String userId}) {
    return FirebaseFirestore.instance.doc('userEntity/$userId').withConverter<UserEntity>(
        fromFirestore: (snapshot, _) => UserEntity.fromJson(snapshot.data()!),
        toFirestore: (question, _) => question.toJson());
    }
}