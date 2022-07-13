// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_review_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BusinessReviewRecord> _$businessReviewRecordSerializer =
    new _$BusinessReviewRecordSerializer();

class _$BusinessReviewRecordSerializer
    implements StructuredSerializer<BusinessReviewRecord> {
  @override
  final Iterable<Type> types = const [
    BusinessReviewRecord,
    _$BusinessReviewRecord
  ];
  @override
  final String wireName = 'BusinessReviewRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, BusinessReviewRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.locationId;
    if (value != null) {
      result
        ..add('location_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.siteType;
    if (value != null) {
      result
        ..add('site_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.siteUrl;
    if (value != null) {
      result
        ..add('site_url')
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
  BusinessReviewRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BusinessReviewRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'location_id':
          result.locationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'site_type':
          result.siteType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'site_url':
          result.siteUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'business_id':
          result.businessId = serializers.deserialize(value,
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

class _$BusinessReviewRecord extends BusinessReviewRecord {
  @override
  final String locationId;
  @override
  final String siteType;
  @override
  final String siteUrl;
  @override
  final String businessId;
  @override
  final DocumentReference<Object> reference;

  factory _$BusinessReviewRecord(
          [void Function(BusinessReviewRecordBuilder) updates]) =>
      (new BusinessReviewRecordBuilder()..update(updates)).build();

  _$BusinessReviewRecord._(
      {this.locationId,
      this.siteType,
      this.siteUrl,
      this.businessId,
      this.reference})
      : super._();

  @override
  BusinessReviewRecord rebuild(
          void Function(BusinessReviewRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BusinessReviewRecordBuilder toBuilder() =>
      new BusinessReviewRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusinessReviewRecord &&
        locationId == other.locationId &&
        siteType == other.siteType &&
        siteUrl == other.siteUrl &&
        businessId == other.businessId &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, locationId.hashCode), siteType.hashCode),
                siteUrl.hashCode),
            businessId.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusinessReviewRecord')
          ..add('locationId', locationId)
          ..add('siteType', siteType)
          ..add('siteUrl', siteUrl)
          ..add('businessId', businessId)
          ..add('reference', reference))
        .toString();
  }
}

class BusinessReviewRecordBuilder
    implements Builder<BusinessReviewRecord, BusinessReviewRecordBuilder> {
  _$BusinessReviewRecord _$v;

  String _locationId;
  String get locationId => _$this._locationId;
  set locationId(String locationId) => _$this._locationId = locationId;

  String _siteType;
  String get siteType => _$this._siteType;
  set siteType(String siteType) => _$this._siteType = siteType;

  String _siteUrl;
  String get siteUrl => _$this._siteUrl;
  set siteUrl(String siteUrl) => _$this._siteUrl = siteUrl;

  String _businessId;
  String get businessId => _$this._businessId;
  set businessId(String businessId) => _$this._businessId = businessId;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BusinessReviewRecordBuilder() {
    BusinessReviewRecord._initializeBuilder(this);
  }

  BusinessReviewRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locationId = $v.locationId;
      _siteType = $v.siteType;
      _siteUrl = $v.siteUrl;
      _businessId = $v.businessId;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusinessReviewRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BusinessReviewRecord;
  }

  @override
  void update(void Function(BusinessReviewRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BusinessReviewRecord build() {
    final _$result = _$v ??
        new _$BusinessReviewRecord._(
            locationId: locationId,
            siteType: siteType,
            siteUrl: siteUrl,
            businessId: businessId,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
