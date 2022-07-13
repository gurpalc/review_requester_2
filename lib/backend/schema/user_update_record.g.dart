// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserUpdateRecord> _$userUpdateRecordSerializer =
    new _$UserUpdateRecordSerializer();

class _$UserUpdateRecordSerializer
    implements StructuredSerializer<UserUpdateRecord> {
  @override
  final Iterable<Type> types = const [UserUpdateRecord, _$UserUpdateRecord];
  @override
  final String wireName = 'UserUpdateRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UserUpdateRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.businessId;
    if (value != null) {
      result
        ..add('business_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userMessage;
    if (value != null) {
      result
        ..add('userMessage')
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
  UserUpdateRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserUpdateRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'business_id':
          result.businessId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userMessage':
          result.userMessage = serializers.deserialize(value,
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

class _$UserUpdateRecord extends UserUpdateRecord {
  @override
  final String name;
  @override
  final DateTime time;
  @override
  final String businessId;
  @override
  final String userMessage;
  @override
  final DocumentReference<Object> reference;

  factory _$UserUpdateRecord(
          [void Function(UserUpdateRecordBuilder) updates]) =>
      (new UserUpdateRecordBuilder()..update(updates)).build();

  _$UserUpdateRecord._(
      {this.name, this.time, this.businessId, this.userMessage, this.reference})
      : super._();

  @override
  UserUpdateRecord rebuild(void Function(UserUpdateRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserUpdateRecordBuilder toBuilder() =>
      new UserUpdateRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserUpdateRecord &&
        name == other.name &&
        time == other.time &&
        businessId == other.businessId &&
        userMessage == other.userMessage &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), time.hashCode), businessId.hashCode),
            userMessage.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserUpdateRecord')
          ..add('name', name)
          ..add('time', time)
          ..add('businessId', businessId)
          ..add('userMessage', userMessage)
          ..add('reference', reference))
        .toString();
  }
}

class UserUpdateRecordBuilder
    implements Builder<UserUpdateRecord, UserUpdateRecordBuilder> {
  _$UserUpdateRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DateTime _time;
  DateTime get time => _$this._time;
  set time(DateTime time) => _$this._time = time;

  String _businessId;
  String get businessId => _$this._businessId;
  set businessId(String businessId) => _$this._businessId = businessId;

  String _userMessage;
  String get userMessage => _$this._userMessage;
  set userMessage(String userMessage) => _$this._userMessage = userMessage;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UserUpdateRecordBuilder() {
    UserUpdateRecord._initializeBuilder(this);
  }

  UserUpdateRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _time = $v.time;
      _businessId = $v.businessId;
      _userMessage = $v.userMessage;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserUpdateRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserUpdateRecord;
  }

  @override
  void update(void Function(UserUpdateRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserUpdateRecord build() {
    final _$result = _$v ??
        new _$UserUpdateRecord._(
            name: name,
            time: time,
            businessId: businessId,
            userMessage: userMessage,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
