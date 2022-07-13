import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'manager_record.g.dart';

abstract class ManagerRecord
    implements Built<ManagerRecord, ManagerRecordBuilder> {
  static Serializer<ManagerRecord> get serializer => _$managerRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'manager_name')
  String get managerName;

  @nullable
  @BuiltValueField(wireName: 'manager_email')
  String get managerEmail;

  @nullable
  @BuiltValueField(wireName: 'owner_id')
  String get ownerId;

  @nullable
  @BuiltValueField(wireName: 'business_id')
  String get businessId;

  @nullable
  @BuiltValueField(wireName: 'location_list')
  BuiltList<String> get locationList;

  @nullable
  @BuiltValueField(wireName: 'business_name')
  String get businessName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ManagerRecordBuilder builder) => builder
    ..managerName = ''
    ..managerEmail = ''
    ..ownerId = ''
    ..businessId = ''
    ..locationList = ListBuilder()
    ..businessName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Manager');

  static Stream<ManagerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ManagerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ManagerRecord._();
  factory ManagerRecord([void Function(ManagerRecordBuilder) updates]) =
      _$ManagerRecord;

  static ManagerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createManagerRecordData({
  String managerName,
  String managerEmail,
  String ownerId,
  String businessId,
  String businessName,
}) =>
    serializers.toFirestore(
        ManagerRecord.serializer,
        ManagerRecord((m) => m
          ..managerName = managerName
          ..managerEmail = managerEmail
          ..ownerId = ownerId
          ..businessId = businessId
          ..locationList = null
          ..businessName = businessName));
