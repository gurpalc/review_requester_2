// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ManagerRecord> _$managerRecordSerializer =
    new _$ManagerRecordSerializer();

class _$ManagerRecordSerializer implements StructuredSerializer<ManagerRecord> {
  @override
  final Iterable<Type> types = const [ManagerRecord, _$ManagerRecord];
  @override
  final String wireName = 'ManagerRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ManagerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.managerName;
    if (value != null) {
      result
        ..add('manager_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.managerEmail;
    if (value != null) {
      result
        ..add('manager_email')
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
    value = object.businessId;
    if (value != null) {
      result
        ..add('business_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationList;
    if (value != null) {
      result
        ..add('location_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.businessName;
    if (value != null) {
      result
        ..add('business_name')
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
  ManagerRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ManagerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'manager_name':
          result.managerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'manager_email':
          result.managerEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner_id':
          result.ownerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'business_id':
          result.businessId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location_list':
          result.locationList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'business_name':
          result.businessName = serializers.deserialize(value,
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

class _$ManagerRecord extends ManagerRecord {
  @override
  final String managerName;
  @override
  final String managerEmail;
  @override
  final String ownerId;
  @override
  final String businessId;
  @override
  final BuiltList<String> locationList;
  @override
  final String businessName;
  @override
  final DocumentReference<Object> reference;

  factory _$ManagerRecord([void Function(ManagerRecordBuilder) updates]) =>
      (new ManagerRecordBuilder()..update(updates)).build();

  _$ManagerRecord._(
      {this.managerName,
      this.managerEmail,
      this.ownerId,
      this.businessId,
      this.locationList,
      this.businessName,
      this.reference})
      : super._();

  @override
  ManagerRecord rebuild(void Function(ManagerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ManagerRecordBuilder toBuilder() => new ManagerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ManagerRecord &&
        managerName == other.managerName &&
        managerEmail == other.managerEmail &&
        ownerId == other.ownerId &&
        businessId == other.businessId &&
        locationList == other.locationList &&
        businessName == other.businessName &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, managerName.hashCode),
                            managerEmail.hashCode),
                        ownerId.hashCode),
                    businessId.hashCode),
                locationList.hashCode),
            businessName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ManagerRecord')
          ..add('managerName', managerName)
          ..add('managerEmail', managerEmail)
          ..add('ownerId', ownerId)
          ..add('businessId', businessId)
          ..add('locationList', locationList)
          ..add('businessName', businessName)
          ..add('reference', reference))
        .toString();
  }
}

class ManagerRecordBuilder
    implements Builder<ManagerRecord, ManagerRecordBuilder> {
  _$ManagerRecord _$v;

  String _managerName;
  String get managerName => _$this._managerName;
  set managerName(String managerName) => _$this._managerName = managerName;

  String _managerEmail;
  String get managerEmail => _$this._managerEmail;
  set managerEmail(String managerEmail) => _$this._managerEmail = managerEmail;

  String _ownerId;
  String get ownerId => _$this._ownerId;
  set ownerId(String ownerId) => _$this._ownerId = ownerId;

  String _businessId;
  String get businessId => _$this._businessId;
  set businessId(String businessId) => _$this._businessId = businessId;

  ListBuilder<String> _locationList;
  ListBuilder<String> get locationList =>
      _$this._locationList ??= new ListBuilder<String>();
  set locationList(ListBuilder<String> locationList) =>
      _$this._locationList = locationList;

  String _businessName;
  String get businessName => _$this._businessName;
  set businessName(String businessName) => _$this._businessName = businessName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ManagerRecordBuilder() {
    ManagerRecord._initializeBuilder(this);
  }

  ManagerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _managerName = $v.managerName;
      _managerEmail = $v.managerEmail;
      _ownerId = $v.ownerId;
      _businessId = $v.businessId;
      _locationList = $v.locationList?.toBuilder();
      _businessName = $v.businessName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ManagerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ManagerRecord;
  }

  @override
  void update(void Function(ManagerRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ManagerRecord build() {
    _$ManagerRecord _$result;
    try {
      _$result = _$v ??
          new _$ManagerRecord._(
              managerName: managerName,
              managerEmail: managerEmail,
              ownerId: ownerId,
              businessId: businessId,
              locationList: _locationList?.build(),
              businessName: businessName,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'locationList';
        _locationList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ManagerRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
