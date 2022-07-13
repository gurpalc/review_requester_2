import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'buy_plan_record.g.dart';

abstract class BuyPlanRecord
    implements Built<BuyPlanRecord, BuyPlanRecordBuilder> {
  static Serializer<BuyPlanRecord> get serializer => _$buyPlanRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'business_id')
  String get businessId;

  @nullable
  @BuiltValueField(wireName: 'plan_type')
  String get planType;

  @nullable
  @BuiltValueField(wireName: 'buy_date')
  DateTime get buyDate;

  @nullable
  @BuiltValueField(wireName: 'expire_date')
  String get expireDate;

  @nullable
  @BuiltValueField(wireName: 'old_review')
  int get oldReview;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BuyPlanRecordBuilder builder) => builder
    ..businessId = ''
    ..planType = ''
    ..expireDate = ''
    ..oldReview = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BuyPlan');

  static Stream<BuyPlanRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BuyPlanRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BuyPlanRecord._();
  factory BuyPlanRecord([void Function(BuyPlanRecordBuilder) updates]) =
      _$BuyPlanRecord;

  static BuyPlanRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBuyPlanRecordData({
  String businessId,
  String planType,
  DateTime buyDate,
  String expireDate,
  int oldReview,
}) =>
    serializers.toFirestore(
        BuyPlanRecord.serializer,
        BuyPlanRecord((b) => b
          ..businessId = businessId
          ..planType = planType
          ..buyDate = buyDate
          ..expireDate = expireDate
          ..oldReview = oldReview));
