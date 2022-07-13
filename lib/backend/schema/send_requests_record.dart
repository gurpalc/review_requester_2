import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'send_requests_record.g.dart';

abstract class SendRequestsRecord
    implements Built<SendRequestsRecord, SendRequestsRecordBuilder> {
  static Serializer<SendRequestsRecord> get serializer =>
      _$sendRequestsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'client_name')
  String get clientName;

  @nullable
  String get message;

  @nullable
  @BuiltValueField(wireName: 'client_number')
  String get clientNumber;

  @nullable
  @BuiltValueField(wireName: 'business_id')
  String get businessId;

  @nullable
  @BuiltValueField(wireName: 'send_time')
  DateTime get sendTime;

  @nullable
  @BuiltValueField(wireName: 'sender_name')
  String get senderName;

  @nullable
  @BuiltValueField(wireName: 'sender_uid')
  String get senderUid;

  @nullable
  @BuiltValueField(wireName: 'client_email')
  String get clientEmail;

  @nullable
  String get location;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SendRequestsRecordBuilder builder) => builder
    ..clientName = ''
    ..message = ''
    ..clientNumber = ''
    ..businessId = ''
    ..senderName = ''
    ..senderUid = ''
    ..clientEmail = ''
    ..location = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SendRequests');

  static Stream<SendRequestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SendRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SendRequestsRecord._();
  factory SendRequestsRecord(
          [void Function(SendRequestsRecordBuilder) updates]) =
      _$SendRequestsRecord;

  static SendRequestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSendRequestsRecordData({
  String clientName,
  String message,
  String clientNumber,
  String businessId,
  DateTime sendTime,
  String senderName,
  String senderUid,
  String clientEmail,
  String location,
}) =>
    serializers.toFirestore(
        SendRequestsRecord.serializer,
        SendRequestsRecord((s) => s
          ..clientName = clientName
          ..message = message
          ..clientNumber = clientNumber
          ..businessId = businessId
          ..sendTime = sendTime
          ..senderName = senderName
          ..senderUid = senderUid
          ..clientEmail = clientEmail
          ..location = location));
