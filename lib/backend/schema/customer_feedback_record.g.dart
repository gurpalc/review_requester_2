// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_feedback_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CustomerFeedbackRecord> _$customerFeedbackRecordSerializer =
    new _$CustomerFeedbackRecordSerializer();

class _$CustomerFeedbackRecordSerializer
    implements StructuredSerializer<CustomerFeedbackRecord> {
  @override
  final Iterable<Type> types = const [
    CustomerFeedbackRecord,
    _$CustomerFeedbackRecord
  ];
  @override
  final String wireName = 'CustomerFeedbackRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CustomerFeedbackRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.employeeName;
    if (value != null) {
      result
        ..add('employee_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
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
    value = object.location;
    if (value != null) {
      result
        ..add('location')
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
  CustomerFeedbackRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomerFeedbackRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'employee_name':
          result.employeeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comments':
          result.comments = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
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

class _$CustomerFeedbackRecord extends CustomerFeedbackRecord {
  @override
  final String rating;
  @override
  final String name;
  @override
  final String number;
  @override
  final String employeeName;
  @override
  final String comments;
  @override
  final DateTime time;
  @override
  final String location;
  @override
  final DocumentReference<Object> reference;

  factory _$CustomerFeedbackRecord(
          [void Function(CustomerFeedbackRecordBuilder) updates]) =>
      (new CustomerFeedbackRecordBuilder()..update(updates)).build();

  _$CustomerFeedbackRecord._(
      {this.rating,
      this.name,
      this.number,
      this.employeeName,
      this.comments,
      this.time,
      this.location,
      this.reference})
      : super._();

  @override
  CustomerFeedbackRecord rebuild(
          void Function(CustomerFeedbackRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerFeedbackRecordBuilder toBuilder() =>
      new CustomerFeedbackRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerFeedbackRecord &&
        rating == other.rating &&
        name == other.name &&
        number == other.number &&
        employeeName == other.employeeName &&
        comments == other.comments &&
        time == other.time &&
        location == other.location &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, rating.hashCode), name.hashCode),
                            number.hashCode),
                        employeeName.hashCode),
                    comments.hashCode),
                time.hashCode),
            location.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomerFeedbackRecord')
          ..add('rating', rating)
          ..add('name', name)
          ..add('number', number)
          ..add('employeeName', employeeName)
          ..add('comments', comments)
          ..add('time', time)
          ..add('location', location)
          ..add('reference', reference))
        .toString();
  }
}

class CustomerFeedbackRecordBuilder
    implements Builder<CustomerFeedbackRecord, CustomerFeedbackRecordBuilder> {
  _$CustomerFeedbackRecord _$v;

  String _rating;
  String get rating => _$this._rating;
  set rating(String rating) => _$this._rating = rating;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _number;
  String get number => _$this._number;
  set number(String number) => _$this._number = number;

  String _employeeName;
  String get employeeName => _$this._employeeName;
  set employeeName(String employeeName) => _$this._employeeName = employeeName;

  String _comments;
  String get comments => _$this._comments;
  set comments(String comments) => _$this._comments = comments;

  DateTime _time;
  DateTime get time => _$this._time;
  set time(DateTime time) => _$this._time = time;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CustomerFeedbackRecordBuilder() {
    CustomerFeedbackRecord._initializeBuilder(this);
  }

  CustomerFeedbackRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rating = $v.rating;
      _name = $v.name;
      _number = $v.number;
      _employeeName = $v.employeeName;
      _comments = $v.comments;
      _time = $v.time;
      _location = $v.location;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerFeedbackRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerFeedbackRecord;
  }

  @override
  void update(void Function(CustomerFeedbackRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomerFeedbackRecord build() {
    final _$result = _$v ??
        new _$CustomerFeedbackRecord._(
            rating: rating,
            name: name,
            number: number,
            employeeName: employeeName,
            comments: comments,
            time: time,
            location: location,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
