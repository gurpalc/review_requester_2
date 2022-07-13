import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'business_details_record.g.dart';

abstract class BusinessDetailsRecord
    implements Built<BusinessDetailsRecord, BusinessDetailsRecordBuilder> {
  static Serializer<BusinessDetailsRecord> get serializer =>
      _$businessDetailsRecordSerializer;

  @nullable
  String get solicited;

  @nullable
  @BuiltValueField(wireName: 'not_solicited')
  String get notSolicited;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BusinessDetailsRecordBuilder builder) =>
      builder
        ..solicited = ''
        ..notSolicited = ''
        ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BusinessDetails');

  static Stream<BusinessDetailsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BusinessDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BusinessDetailsRecord._();
  factory BusinessDetailsRecord(
          [void Function(BusinessDetailsRecordBuilder) updates]) =
      _$BusinessDetailsRecord;

  static BusinessDetailsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBusinessDetailsRecordData({
  String solicited,
  String notSolicited,
  String type,
}) =>
    serializers.toFirestore(
        BusinessDetailsRecord.serializer,
        BusinessDetailsRecord((b) => b
          ..solicited = solicited
          ..notSolicited = notSolicited
          ..type = type));
