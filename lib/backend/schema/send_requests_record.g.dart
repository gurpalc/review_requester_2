// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_requests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SendRequestsRecord> _$sendRequestsRecordSerializer =
    new _$SendRequestsRecordSerializer();

class _$SendRequestsRecordSerializer
    implements StructuredSerializer<SendRequestsRecord> {
  @override
  final Iterable<Type> types = const [SendRequestsRecord, _$SendRequestsRecord];
  @override
  final String wireName = 'SendRequestsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SendRequestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.clientName;
    if (value != null) {
      result
        ..add('client_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clientNumber;
    if (value != null) {
      result
        ..add('client_number')
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
    value = object.sendTime;
    if (value != null) {
      result
        ..add('send_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.senderName;
    if (value != null) {
      result
        ..add('sender_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.senderUid;
    if (value != null) {
      result
        ..add('sender_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clientEmail;
    if (value != null) {
      result
        ..add('client_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  SendRequestsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SendRequestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'client_name':
          result.clientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'client_number':
          result.clientNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'business_id':
          result.businessId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'send_time':
          result.sendTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'sender_name':
          result.senderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sender_uid':
          result.senderUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'client_email':
          result.clientEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$SendRequestsRecord extends SendRequestsRecord {
  @override
  final String clientName;
  @override
  final String message;
  @override
  final String clientNumber;
  @override
  final String businessId;
  @override
  final DateTime sendTime;
  @override
  final String senderName;
  @override
  final String senderUid;
  @override
  final String clientEmail;
  @override
  final String location;
  @override
  final DocumentReference<Object> reference;

  factory _$SendRequestsRecord(
          [void Function(SendRequestsRecordBuilder) updates]) =>
      (new SendRequestsRecordBuilder()..update(updates)).build();

  _$SendRequestsRecord._(
      {this.clientName,
      this.message,
      this.clientNumber,
      this.businessId,
      this.sendTime,
      this.senderName,
      this.senderUid,
      this.clientEmail,
      this.location,
      this.reference})
      : super._();

  @override
  SendRequestsRecord rebuild(
          void Function(SendRequestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendRequestsRecordBuilder toBuilder() =>
      new SendRequestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendRequestsRecord &&
        clientName == other.clientName &&
        message == other.message &&
        clientNumber == other.clientNumber &&
        businessId == other.businessId &&
        sendTime == other.sendTime &&
        senderName == other.senderName &&
        senderUid == other.senderUid &&
        clientEmail == other.clientEmail &&
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
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, clientName.hashCode),
                                        message.hashCode),
                                    clientNumber.hashCode),
                                businessId.hashCode),
                            sendTime.hashCode),
                        senderName.hashCode),
                    senderUid.hashCode),
                clientEmail.hashCode),
            location.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SendRequestsRecord')
          ..add('clientName', clientName)
          ..add('message', message)
          ..add('clientNumber', clientNumber)
          ..add('businessId', businessId)
          ..add('sendTime', sendTime)
          ..add('senderName', senderName)
          ..add('senderUid', senderUid)
          ..add('clientEmail', clientEmail)
          ..add('location', location)
          ..add('reference', reference))
        .toString();
  }
}

class SendRequestsRecordBuilder
    implements Builder<SendRequestsRecord, SendRequestsRecordBuilder> {
  _$SendRequestsRecord _$v;

  String _clientName;
  String get clientName => _$this._clientName;
  set clientName(String clientName) => _$this._clientName = clientName;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _clientNumber;
  String get clientNumber => _$this._clientNumber;
  set clientNumber(String clientNumber) => _$this._clientNumber = clientNumber;

  String _businessId;
  String get businessId => _$this._businessId;
  set businessId(String businessId) => _$this._businessId = businessId;

  DateTime _sendTime;
  DateTime get sendTime => _$this._sendTime;
  set sendTime(DateTime sendTime) => _$this._sendTime = sendTime;

  String _senderName;
  String get senderName => _$this._senderName;
  set senderName(String senderName) => _$this._senderName = senderName;

  String _senderUid;
  String get senderUid => _$this._senderUid;
  set senderUid(String senderUid) => _$this._senderUid = senderUid;

  String _clientEmail;
  String get clientEmail => _$this._clientEmail;
  set clientEmail(String clientEmail) => _$this._clientEmail = clientEmail;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SendRequestsRecordBuilder() {
    SendRequestsRecord._initializeBuilder(this);
  }

  SendRequestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientName = $v.clientName;
      _message = $v.message;
      _clientNumber = $v.clientNumber;
      _businessId = $v.businessId;
      _sendTime = $v.sendTime;
      _senderName = $v.senderName;
      _senderUid = $v.senderUid;
      _clientEmail = $v.clientEmail;
      _location = $v.location;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendRequestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendRequestsRecord;
  }

  @override
  void update(void Function(SendRequestsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SendRequestsRecord build() {
    final _$result = _$v ??
        new _$SendRequestsRecord._(
            clientName: clientName,
            message: message,
            clientNumber: clientNumber,
            businessId: businessId,
            sendTime: sendTime,
            senderName: senderName,
            senderUid: senderUid,
            clientEmail: clientEmail,
            location: location,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
