import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'business_review_record.g.dart';

abstract class BusinessReviewRecord
    implements Built<BusinessReviewRecord, BusinessReviewRecordBuilder> {
  static Serializer<BusinessReviewRecord> get serializer =>
      _$businessReviewRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'location_id')
  String get locationId;

  @nullable
  @BuiltValueField(wireName: 'site_type')
  String get siteType;

  @nullable
  @BuiltValueField(wireName: 'site_url')
  String get siteUrl;

  @nullable
  @BuiltValueField(wireName: 'business_id')
  String get businessId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BusinessReviewRecordBuilder builder) => builder
    ..locationId = ''
    ..siteType = ''
    ..siteUrl = ''
    ..businessId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BusinessReview');

  static Stream<BusinessReviewRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BusinessReviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BusinessReviewRecord._();
  factory BusinessReviewRecord(
          [void Function(BusinessReviewRecordBuilder) updates]) =
      _$BusinessReviewRecord;

  static BusinessReviewRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBusinessReviewRecordData({
  String locationId,
  String siteType,
  String siteUrl,
  String businessId,
}) =>
    serializers.toFirestore(
        BusinessReviewRecord.serializer,
        BusinessReviewRecord((b) => b
          ..locationId = locationId
          ..siteType = siteType
          ..siteUrl = siteUrl
          ..businessId = businessId));
