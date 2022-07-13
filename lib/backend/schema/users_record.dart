import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Password')
  String get password;

  @nullable
  String get uid;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'user_type')
  String get userType;

  @nullable
  @BuiltValueField(wireName: 'business_name')
  String get businessName;

  @nullable
  @BuiltValueField(wireName: 'business_id')
  String get businessId;

  @nullable
  @BuiltValueField(wireName: 'number_requests')
  int get numberRequests;

  @nullable
  bool get solicited;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..password = ''
    ..uid = ''
    ..email = ''
    ..displayName = ''
    ..phoneNumber = ''
    ..photoUrl = ''
    ..userType = ''
    ..businessName = ''
    ..businessId = ''
    ..numberRequests = 0
    ..solicited = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String password,
  String uid,
  String email,
  String displayName,
  DateTime createdTime,
  String phoneNumber,
  String photoUrl,
  String userType,
  String businessName,
  String businessId,
  int numberRequests,
  bool solicited,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..password = password
          ..uid = uid
          ..email = email
          ..displayName = displayName
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..photoUrl = photoUrl
          ..userType = userType
          ..businessName = businessName
          ..businessId = businessId
          ..numberRequests = numberRequests
          ..solicited = solicited));
