import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_update_record.g.dart';

abstract class UserUpdateRecord
    implements Built<UserUpdateRecord, UserUpdateRecordBuilder> {
  static Serializer<UserUpdateRecord> get serializer =>
      _$userUpdateRecordSerializer;

  @nullable
  String get name;

  @nullable
  DateTime get time;

  @nullable
  @BuiltValueField(wireName: 'business_id')
  String get businessId;

  @nullable
  String get userMessage;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserUpdateRecordBuilder builder) => builder
    ..name = ''
    ..businessId = ''
    ..userMessage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UserUpdate');

  static Stream<UserUpdateRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserUpdateRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserUpdateRecord._();
  factory UserUpdateRecord([void Function(UserUpdateRecordBuilder) updates]) =
      _$UserUpdateRecord;

  static UserUpdateRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserUpdateRecordData({
  String name,
  DateTime time,
  String businessId,
  String userMessage,
}) =>
    serializers.toFirestore(
        UserUpdateRecord.serializer,
        UserUpdateRecord((u) => u
          ..name = name
          ..time = time
          ..businessId = businessId
          ..userMessage = userMessage));
