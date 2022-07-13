// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'texts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TextsRecord> _$textsRecordSerializer = new _$TextsRecordSerializer();

class _$TextsRecordSerializer implements StructuredSerializer<TextsRecord> {
  @override
  final Iterable<Type> types = const [TextsRecord, _$TextsRecord];
  @override
  final String wireName = 'TextsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TextsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.reviewRequestContent;
    if (value != null) {
      result
        ..add('reviewRequestContent')
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
  TextsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TextsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'reviewRequestContent':
          result.reviewRequestContent = serializers.deserialize(value,
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

class _$TextsRecord extends TextsRecord {
  @override
  final String reviewRequestContent;
  @override
  final DocumentReference<Object> reference;

  factory _$TextsRecord([void Function(TextsRecordBuilder) updates]) =>
      (new TextsRecordBuilder()..update(updates)).build();

  _$TextsRecord._({this.reviewRequestContent, this.reference}) : super._();

  @override
  TextsRecord rebuild(void Function(TextsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextsRecordBuilder toBuilder() => new TextsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextsRecord &&
        reviewRequestContent == other.reviewRequestContent &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, reviewRequestContent.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TextsRecord')
          ..add('reviewRequestContent', reviewRequestContent)
          ..add('reference', reference))
        .toString();
  }
}

class TextsRecordBuilder implements Builder<TextsRecord, TextsRecordBuilder> {
  _$TextsRecord _$v;

  String _reviewRequestContent;
  String get reviewRequestContent => _$this._reviewRequestContent;
  set reviewRequestContent(String reviewRequestContent) =>
      _$this._reviewRequestContent = reviewRequestContent;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TextsRecordBuilder() {
    TextsRecord._initializeBuilder(this);
  }

  TextsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reviewRequestContent = $v.reviewRequestContent;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TextsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextsRecord;
  }

  @override
  void update(void Function(TextsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TextsRecord build() {
    final _$result = _$v ??
        new _$TextsRecord._(
            reviewRequestContent: reviewRequestContent, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
