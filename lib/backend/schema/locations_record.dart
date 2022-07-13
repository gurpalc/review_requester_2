import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'locations_record.g.dart';

abstract class LocationsRecord
    implements Built<LocationsRecord, LocationsRecordBuilder> {
  static Serializer<LocationsRecord> get serializer =>
      _$locationsRecordSerializer;

  @nullable
  String get address;

  @nullable
  @BuiltValueField(wireName: 'owner_id')
  String get ownerId;

  @nullable
  @BuiltValueField(wireName: 'location_id')
  String get locationId;

  @nullable
  @BuiltValueField(wireName: 'business_id')
  String get businessId;

  @nullable
  @BuiltValueField(wireName: 'fb_reviewsite')
  String get fbReviewsite;

  @nullable
  @BuiltValueField(wireName: 'google_reviewsite')
  String get googleReviewsite;

  @nullable
  @BuiltValueField(wireName: 'yelp_reviewsite')
  String get yelpReviewsite;

  @nullable
  @BuiltValueField(wireName: 'other_reviewsite')
  String get otherReviewsite;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LocationsRecordBuilder builder) => builder
    ..address = ''
    ..ownerId = ''
    ..locationId = ''
    ..businessId = ''
    ..fbReviewsite = ''
    ..googleReviewsite = ''
    ..yelpReviewsite = ''
    ..otherReviewsite = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Locations');

  static Stream<LocationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LocationsRecord._();
  factory LocationsRecord([void Function(LocationsRecordBuilder) updates]) =
      _$LocationsRecord;

  static LocationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLocationsRecordData({
  String address,
  String ownerId,
  String locationId,
  String businessId,
  String fbReviewsite,
  String googleReviewsite,
  String yelpReviewsite,
  String otherReviewsite,
}) =>
    serializers.toFirestore(
        LocationsRecord.serializer,
        LocationsRecord((l) => l
          ..address = address
          ..ownerId = ownerId
          ..locationId = locationId
          ..businessId = businessId
          ..fbReviewsite = fbReviewsite
          ..googleReviewsite = googleReviewsite
          ..yelpReviewsite = yelpReviewsite
          ..otherReviewsite = otherReviewsite));
