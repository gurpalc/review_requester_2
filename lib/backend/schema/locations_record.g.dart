// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LocationsRecord> _$locationsRecordSerializer =
    new _$LocationsRecordSerializer();

class _$LocationsRecordSerializer
    implements StructuredSerializer<LocationsRecord> {
  @override
  final Iterable<Type> types = const [LocationsRecord, _$LocationsRecord];
  @override
  final String wireName = 'LocationsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, LocationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerId;
    if (value != null) {
      result
        ..add('owner_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationId;
    if (value != null) {
      result
        ..add('location_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.businessId;
    if (value != null) {
      result
        ..add('business_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fbReviewsite;
    if (value != null) {
      result
        ..add('fb_reviewsite')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.googleReviewsite;
    if (value != null) {
      result
        ..add('google_reviewsite')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.yelpReviewsite;
    if (value != null) {
      result
        ..add('yelp_reviewsite')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.otherReviewsite;
    if (value != null) {
      result
        ..add('other_reviewsite')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  LocationsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner_id':
          result.ownerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location_id':
          result.locationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'business_id':
          result.businessId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fb_reviewsite':
          result.fbReviewsite = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'google_reviewsite':
          result.googleReviewsite = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'yelp_reviewsite':
          result.yelpReviewsite = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'other_reviewsite':
          result.otherReviewsite = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$LocationsRecord extends LocationsRecord {
  @override
  final String address;
  @override
  final String ownerId;
  @override
  final String locationId;
  @override
  final String businessId;
  @override
  final String fbReviewsite;
  @override
  final String googleReviewsite;
  @override
  final String yelpReviewsite;
  @override
  final String otherReviewsite;
  @override
  final DocumentReference<Object> reference;

  factory _$LocationsRecord([void Function(LocationsRecordBuilder) updates]) =>
      (new LocationsRecordBuilder()..update(updates)).build();

  _$LocationsRecord._(
      {this.address,
      this.ownerId,
      this.locationId,
      this.businessId,
      this.fbReviewsite,
      this.googleReviewsite,
      this.yelpReviewsite,
      this.otherReviewsite,
      this.reference})
      : super._();

  @override
  LocationsRecord rebuild(void Function(LocationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationsRecordBuilder toBuilder() =>
      new LocationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationsRecord &&
        address == other.address &&
        ownerId == other.ownerId &&
        locationId == other.locationId &&
        businessId == other.businessId &&
        fbReviewsite == other.fbReviewsite &&
        googleReviewsite == other.googleReviewsite &&
        yelpReviewsite == other.yelpReviewsite &&
        otherReviewsite == other.otherReviewsite &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, address.hashCode), ownerId.hashCode),
                                locationId.hashCode),
                            businessId.hashCode),
                        fbReviewsite.hashCode),
                    googleReviewsite.hashCode),
                yelpReviewsite.hashCode),
            otherReviewsite.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LocationsRecord')
          ..add('address', address)
          ..add('ownerId', ownerId)
          ..add('locationId', locationId)
          ..add('businessId', businessId)
          ..add('fbReviewsite', fbReviewsite)
          ..add('googleReviewsite', googleReviewsite)
          ..add('yelpReviewsite', yelpReviewsite)
          ..add('otherReviewsite', otherReviewsite)
          ..add('reference', reference))
        .toString();
  }
}

class LocationsRecordBuilder
    implements Builder<LocationsRecord, LocationsRecordBuilder> {
  _$LocationsRecord _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _ownerId;
  String get ownerId => _$this._ownerId;
  set ownerId(String ownerId) => _$this._ownerId = ownerId;

  String _locationId;
  String get locationId => _$this._locationId;
  set locationId(String locationId) => _$this._locationId = locationId;

  String _businessId;
  String get businessId => _$this._businessId;
  set businessId(String businessId) => _$this._businessId = businessId;

  String _fbReviewsite;
  String get fbReviewsite => _$this._fbReviewsite;
  set fbReviewsite(String fbReviewsite) => _$this._fbReviewsite = fbReviewsite;

  String _googleReviewsite;
  String get googleReviewsite => _$this._googleReviewsite;
  set googleReviewsite(String googleReviewsite) =>
      _$this._googleReviewsite = googleReviewsite;

  String _yelpReviewsite;
  String get yelpReviewsite => _$this._yelpReviewsite;
  set yelpReviewsite(String yelpReviewsite) =>
      _$this._yelpReviewsite = yelpReviewsite;

  String _otherReviewsite;
  String get otherReviewsite => _$this._otherReviewsite;
  set otherReviewsite(String otherReviewsite) =>
      _$this._otherReviewsite = otherReviewsite;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  LocationsRecordBuilder() {
    LocationsRecord._initializeBuilder(this);
  }

  LocationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _ownerId = $v.ownerId;
      _locationId = $v.locationId;
      _businessId = $v.businessId;
      _fbReviewsite = $v.fbReviewsite;
      _googleReviewsite = $v.googleReviewsite;
      _yelpReviewsite = $v.yelpReviewsite;
      _otherReviewsite = $v.otherReviewsite;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LocationsRecord;
  }

  @override
  void update(void Function(LocationsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LocationsRecord build() {
    final _$result = _$v ??
        new _$LocationsRecord._(
            address: address,
            ownerId: ownerId,
            locationId: locationId,
            businessId: businessId,
            fbReviewsite: fbReviewsite,
            googleReviewsite: googleReviewsite,
            yelpReviewsite: yelpReviewsite,
            otherReviewsite: otherReviewsite,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
