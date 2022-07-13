import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'employee_record.g.dart';

abstract class EmployeeRecord
    implements Built<EmployeeRecord, EmployeeRecordBuilder> {
  static Serializer<EmployeeRecord> get serializer =>
      _$employeeRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'employee_name')
  String get employeeName;

  @nullable
  @BuiltValueField(wireName: 'employee_email')
  String get employeeEmail;

  @nullable
  @BuiltValueField(wireName: 'owner_id')
  String get ownerId;

  @nullable
  @BuiltValueField(wireName: 'business_id')
  String get businessId;

  @nullable
  @BuiltValueField(wireName: 'employee_uid')
  String get employeeUid;

  @nullable
  @BuiltValueField(wireName: 'business_name')
  String get businessName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EmployeeRecordBuilder builder) => builder
    ..employeeName = ''
    ..employeeEmail = ''
    ..ownerId = ''
    ..businessId = ''
    ..employeeUid = ''
    ..businessName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Employee');

  static Stream<EmployeeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EmployeeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EmployeeRecord._();
  factory EmployeeRecord([void Function(EmployeeRecordBuilder) updates]) =
      _$EmployeeRecord;

  static EmployeeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEmployeeRecordData({
  String employeeName,
  String employeeEmail,
  String ownerId,
  String businessId,
  String employeeUid,
  String businessName,
}) =>
    serializers.toFirestore(
        EmployeeRecord.serializer,
        EmployeeRecord((e) => e
          ..employeeName = employeeName
          ..employeeEmail = employeeEmail
          ..ownerId = ownerId
          ..businessId = businessId
          ..employeeUid = employeeUid
          ..businessName = businessName));
