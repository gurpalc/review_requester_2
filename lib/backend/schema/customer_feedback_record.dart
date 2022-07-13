import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'customer_feedback_record.g.dart';

abstract class CustomerFeedbackRecord
    implements Built<CustomerFeedbackRecord, CustomerFeedbackRecordBuilder> {
  static Serializer<CustomerFeedbackRecord> get serializer =>
      _$customerFeedbackRecordSerializer;

  @nullable
  String get rating;

  @nullable
  String get name;

  @nullable
  String get number;

  @nullable
  @BuiltValueField(wireName: 'employee_name')
  String get employeeName;

  @nullable
  String get comments;

  @nullable
  DateTime get time;

  @nullable
  String get location;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CustomerFeedbackRecordBuilder builder) =>
      builder
        ..rating = ''
        ..name = ''
        ..number = ''
        ..employeeName = ''
        ..comments = ''
        ..location = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CustomerFeedback');

  static Stream<CustomerFeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CustomerFeedbackRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CustomerFeedbackRecord._();
  factory CustomerFeedbackRecord(
          [void Function(CustomerFeedbackRecordBuilder) updates]) =
      _$CustomerFeedbackRecord;

  static CustomerFeedbackRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCustomerFeedbackRecordData({
  String rating,
  String name,
  String number,
  String employeeName,
  String comments,
  DateTime time,
  String location,
}) =>
    serializers.toFirestore(
        CustomerFeedbackRecord.serializer,
        CustomerFeedbackRecord((c) => c
          ..rating = rating
          ..name = name
          ..number = number
          ..employeeName = employeeName
          ..comments = comments
          ..time = time
          ..location = location));
