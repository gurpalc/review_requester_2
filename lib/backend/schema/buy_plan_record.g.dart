// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_plan_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuyPlanRecord> _$buyPlanRecordSerializer =
    new _$BuyPlanRecordSerializer();

class _$BuyPlanRecordSerializer implements StructuredSerializer<BuyPlanRecord> {
  @override
  final Iterable<Type> types = const [BuyPlanRecord, _$BuyPlanRecord];
  @override
  final String wireName = 'BuyPlanRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BuyPlanRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.businessId;
    if (value != null) {
      result
        ..add('business_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.planType;
    if (value != null) {
      result
        ..add('plan_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.buyDate;
    if (value != null) {
      result
        ..add('buy_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.oldReview;
    if (value != null) {
      result
        ..add('old_review')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  BuyPlanRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuyPlanRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'business_id':
          result.businessId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'plan_type':
          result.planType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'buy_date':
          result.buyDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'expire_date':
          result.expireDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'old_review':
          result.oldReview = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$BuyPlanRecord extends BuyPlanRecord {
  @override
  final String businessId;
  @override
  final String planType;
  @override
  final DateTime buyDate;
  @override
  final String expireDate;
  @override
  final int oldReview;
  @override
  final DocumentReference<Object> reference;

  factory _$BuyPlanRecord([void Function(BuyPlanRecordBuilder) updates]) =>
      (new BuyPlanRecordBuilder()..update(updates)).build();

  _$BuyPlanRecord._(
      {this.businessId,
      this.planType,
      this.buyDate,
      this.expireDate,
      this.oldReview,
      this.reference})
      : super._();

  @override
  BuyPlanRecord rebuild(void Function(BuyPlanRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuyPlanRecordBuilder toBuilder() => new BuyPlanRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuyPlanRecord &&
        businessId == other.businessId &&
        planType == other.planType &&
        buyDate == other.buyDate &&
        expireDate == other.expireDate &&
        oldReview == other.oldReview &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, businessId.hashCode), planType.hashCode),
                    buyDate.hashCode),
                expireDate.hashCode),
            oldReview.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuyPlanRecord')
          ..add('businessId', businessId)
          ..add('planType', planType)
          ..add('buyDate', buyDate)
          ..add('expireDate', expireDate)
          ..add('oldReview', oldReview)
          ..add('reference', reference))
        .toString();
  }
}

class BuyPlanRecordBuilder
    implements Builder<BuyPlanRecord, BuyPlanRecordBuilder> {
  _$BuyPlanRecord _$v;

  String _businessId;
  String get businessId => _$this._businessId;
  set businessId(String businessId) => _$this._businessId = businessId;

  String _planType;
  String get planType => _$this._planType;
  set planType(String planType) => _$this._planType = planType;

  DateTime _buyDate;
  DateTime get buyDate => _$this._buyDate;
  set buyDate(DateTime buyDate) => _$this._buyDate = buyDate;

  String _expireDate;
  String get expireDate => _$this._expireDate;
  set expireDate(String expireDate) => _$this._expireDate = expireDate;

  int _oldReview;
  int get oldReview => _$this._oldReview;
  set oldReview(int oldReview) => _$this._oldReview = oldReview;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BuyPlanRecordBuilder() {
    BuyPlanRecord._initializeBuilder(this);
  }

  BuyPlanRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _businessId = $v.businessId;
      _planType = $v.planType;
      _buyDate = $v.buyDate;
      _expireDate = $v.expireDate;
      _oldReview = $v.oldReview;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuyPlanRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuyPlanRecord;
  }

  @override
  void update(void Function(BuyPlanRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuyPlanRecord build() {
    final _$result = _$v ??
        new _$BuyPlanRecord._(
            businessId: businessId,
            planType: planType,
            buyDate: buyDate,
            expireDate: expireDate,
            oldReview: oldReview,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
