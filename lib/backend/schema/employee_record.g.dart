// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EmployeeRecord> _$employeeRecordSerializer =
    new _$EmployeeRecordSerializer();

class _$EmployeeRecordSerializer
    implements StructuredSerializer<EmployeeRecord> {
  @override
  final Iterable<Type> types = const [EmployeeRecord, _$EmployeeRecord];
  @override
  final String wireName = 'EmployeeRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, EmployeeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.employeeName;
    if (value != null) {
      result
        ..add('employee_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.employeeEmail;
    if (value != null) {
      result
        ..add('employee_email')
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
    value = object.employeeUid;
    if (value != null) {
      result
        ..add('employee_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  EmployeeRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmployeeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'employee_name':
          result.employeeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'employee_email':
          result.employeeEmail = serializers.deserialize(value,
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
        case 'employee_uid':
          result.employeeUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$EmployeeRecord extends EmployeeRecord {
  @override
  final String employeeName;
  @override
  final String employeeEmail;
  @override
  final String ownerId;
  @override
  final String businessId;
  @override
  final String employeeUid;
  @override
  final String businessName;
  @override
  final DocumentReference<Object> reference;

  factory _$EmployeeRecord([void Function(EmployeeRecordBuilder) updates]) =>
      (new EmployeeRecordBuilder()..update(updates)).build();

  _$EmployeeRecord._(
      {this.employeeName,
      this.employeeEmail,
      this.ownerId,
      this.businessId,
      this.employeeUid,
      this.businessName,
      this.reference})
      : super._();

  @override
  EmployeeRecord rebuild(void Function(EmployeeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeRecordBuilder toBuilder() =>
      new EmployeeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmployeeRecord &&
        employeeName == other.employeeName &&
        employeeEmail == other.employeeEmail &&
        ownerId == other.ownerId &&
        businessId == other.businessId &&
        employeeUid == other.employeeUid &&
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
                        $jc($jc(0, employeeName.hashCode),
                            employeeEmail.hashCode),
                        ownerId.hashCode),
                    businessId.hashCode),
                employeeUid.hashCode),
            businessName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EmployeeRecord')
          ..add('employeeName', employeeName)
          ..add('employeeEmail', employeeEmail)
          ..add('ownerId', ownerId)
          ..add('businessId', businessId)
          ..add('employeeUid', employeeUid)
          ..add('businessName', businessName)
          ..add('reference', reference))
        .toString();
  }
}

class EmployeeRecordBuilder
    implements Builder<EmployeeRecord, EmployeeRecordBuilder> {
  _$EmployeeRecord _$v;

  String _employeeName;
  String get employeeName => _$this._employeeName;
  set employeeName(String employeeName) => _$this._employeeName = employeeName;

  String _employeeEmail;
  String get employeeEmail => _$this._employeeEmail;
  set employeeEmail(String employeeEmail) =>
      _$this._employeeEmail = employeeEmail;

  String _ownerId;
  String get ownerId => _$this._ownerId;
  set ownerId(String ownerId) => _$this._ownerId = ownerId;

  String _businessId;
  String get businessId => _$this._businessId;
  set businessId(String businessId) => _$this._businessId = businessId;

  String _employeeUid;
  String get employeeUid => _$this._employeeUid;
  set employeeUid(String employeeUid) => _$this._employeeUid = employeeUid;

  String _businessName;
  String get businessName => _$this._businessName;
  set businessName(String businessName) => _$this._businessName = businessName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  EmployeeRecordBuilder() {
    EmployeeRecord._initializeBuilder(this);
  }

  EmployeeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _employeeName = $v.employeeName;
      _employeeEmail = $v.employeeEmail;
      _ownerId = $v.ownerId;
      _businessId = $v.businessId;
      _employeeUid = $v.employeeUid;
      _businessName = $v.businessName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmployeeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmployeeRecord;
  }

  @override
  void update(void Function(EmployeeRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EmployeeRecord build() {
    final _$result = _$v ??
        new _$EmployeeRecord._(
            employeeName: employeeName,
            employeeEmail: employeeEmail,
            ownerId: ownerId,
            businessId: businessId,
            employeeUid: employeeUid,
            businessName: businessName,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
