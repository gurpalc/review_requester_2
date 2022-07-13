// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BusinessDetailsRecord> _$businessDetailsRecordSerializer =
    new _$BusinessDetailsRecordSerializer();

class _$BusinessDetailsRecordSerializer
    implements StructuredSerializer<BusinessDetailsRecord> {
  @override
  final Iterable<Type> types = const [
    BusinessDetailsRecord,
    _$BusinessDetailsRecord
  ];
  @override
  final String wireName = 'BusinessDetailsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, BusinessDetailsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.solicited;
    if (value != null) {
      result
        ..add('solicited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notSolicited;
    if (value != null) {
      result
        ..add('not_solicited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  BusinessDetailsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BusinessDetailsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'solicited':
          result.solicited = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'not_solicited':
          result.notSolicited = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$BusinessDetailsRecord extends BusinessDetailsRecord {
  @override
  final String solicited;
  @override
  final String notSolicited;
  @override
  final String type;
  @override
  final DocumentReference<Object> reference;

  factory _$BusinessDetailsRecord(
          [void Function(BusinessDetailsRecordBuilder) updates]) =>
      (new BusinessDetailsRecordBuilder()..update(updates)).build();

  _$BusinessDetailsRecord._(
      {this.solicited, this.notSolicited, this.type, this.reference})
      : super._();

  @override
  BusinessDetailsRecord rebuild(
          void Function(BusinessDetailsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BusinessDetailsRecordBuilder toBuilder() =>
      new BusinessDetailsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusinessDetailsRecord &&
        solicited == other.solicited &&
        notSolicited == other.notSolicited &&
        type == other.type &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, solicited.hashCode), notSolicited.hashCode),
            type.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusinessDetailsRecord')
          ..add('solicited', solicited)
          ..add('notSolicited', notSolicited)
          ..add('type', type)
          ..add('reference', reference))
        .toString();
  }
}

class BusinessDetailsRecordBuilder
    implements Builder<BusinessDetailsRecord, BusinessDetailsRecordBuilder> {
  _$BusinessDetailsRecord _$v;

  String _solicited;
  String get solicited => _$this._solicited;
  set solicited(String solicited) => _$this._solicited = solicited;

  String _notSolicited;
  String get notSolicited => _$this._notSolicited;
  set notSolicited(String notSolicited) => _$this._notSolicited = notSolicited;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BusinessDetailsRecordBuilder() {
    BusinessDetailsRecord._initializeBuilder(this);
  }

  BusinessDetailsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _solicited = $v.solicited;
      _notSolicited = $v.notSolicited;
      _type = $v.type;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusinessDetailsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BusinessDetailsRecord;
  }

  @override
  void update(void Function(BusinessDetailsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BusinessDetailsRecord build() {
    final _$result = _$v ??
        new _$BusinessDetailsRecord._(
            solicited: solicited,
            notSolicited: notSolicited,
            type: type,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
