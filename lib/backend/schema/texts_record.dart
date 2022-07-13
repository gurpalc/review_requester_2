import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'texts_record.g.dart';

abstract class TextsRecord implements Built<TextsRecord, TextsRecordBuilder> {
  static Serializer<TextsRecord> get serializer => _$textsRecordSerializer;

  @nullable
  String get reviewRequestContent;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TextsRecordBuilder builder) =>
      builder..reviewRequestContent = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Texts');

  static Stream<TextsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TextsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TextsRecord._();
  factory TextsRecord([void Function(TextsRecordBuilder) updates]) =
      _$TextsRecord;

  static TextsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTextsRecordData({
  String reviewRequestContent,
}) =>
    serializers.toFirestore(TextsRecord.serializer,
        TextsRecord((t) => t..reviewRequestContent = reviewRequestContent));
