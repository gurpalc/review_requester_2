import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/buy_subscription_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendSMSWidget extends StatefulWidget {
  const SendSMSWidget({Key key}) : super(key: key);

  @override
  _SendSMSWidgetState createState() => _SendSMSWidgetState();
}

class _SendSMSWidgetState extends State<SendSMSWidget> {
  String emailDropDown1Value;
  TextEditingController clientemailController;
  TextEditingController emailFullNameController;
  String emailDropDown2Value;
  bool checkboxListTileValue2;
  String emailMessage1;
  String emailUrl;
  String reviewLinkRemoveEmail;
  String reviewLinkEmail;
  String emailMessage2;
  String numberDropDown1Value;
  TextEditingController numberFullNameController;
  TextEditingController phoneNumberController;
  String numberDropDown2Value;
  bool checkboxListTileValue1;
  String numberMessage1;
  String reviewLink;
  String reviewLinkRemove;
  String url;
  String numberMessage2;
  final formKey1 = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    clientemailController = TextEditingController();
    emailFullNameController = TextEditingController();
    numberFullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Send',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'San Francisco Pro',
                color: Colors.white,
                fontSize: 22,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).white,
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              labelColor: FlutterFlowTheme.of(context).primaryColor,
              labelStyle: FlutterFlowTheme.of(context).bodyText1,
              indicatorColor: FlutterFlowTheme.of(context).primaryColor,
              tabs: [
                Tab(
                  text: 'Text message',
                ),
                Tab(
                  text: 'Email',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<EmployeeRecord>>(
                        stream: queryEmployeeRecord(
                          queryBuilder: (employeeRecord) =>
                              employeeRecord.where('business_id',
                                  isEqualTo: valueOrDefault(
                                      currentUserDocument?.businessId, '')),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<EmployeeRecord> columnEmployeeRecordList =
                              snapshot.data;
                          final columnEmployeeRecord =
                              columnEmployeeRecordList.isNotEmpty
                                  ? columnEmployeeRecordList.first
                                  : null;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((valueOrDefault(
                                        currentUserDocument?.userType, '')) !=
                                    'Employee')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Number of SMS Review Requests Left',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      'San Francisco Pro',
                                                  fontSize: 18,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) => usersRecord
                                                    .where('business_id',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.businessId,
                                                            ''))
                                                    .where('user_type',
                                                        isEqualTo: 'Owner'),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    textUsersRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final textUsersRecord =
                                                    textUsersRecordList
                                                            .isNotEmpty
                                                        ? textUsersRecordList
                                                            .first
                                                        : null;
                                                return Text(
                                                  textUsersRecord.numberRequests
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Form(
                                  key: formKey1,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 10, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 120,
                                                  height: 49,
                                                  child: custom_widgets
                                                      .CountryCode(
                                                    width: 120,
                                                    height: 49,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: TextFormField(
                                                  controller:
                                                      phoneNumberController,
                                                  onFieldSubmitted: (_) async {
                                                    if (formKey1.currentState ==
                                                            null ||
                                                        !formKey1.currentState
                                                            .validate()) {
                                                      return;
                                                    }
                                                  },
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Phone Number',
                                                    hintText:
                                                        'Enter client\'s phone number...',
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  validator: (val) {
                                                    if (val == null ||
                                                        val.isEmpty) {
                                                      return 'Field is required';
                                                    }

                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: TextFormField(
                                            controller:
                                                numberFullNameController,
                                            onFieldSubmitted: (_) async {
                                              if (formKey1.currentState ==
                                                      null ||
                                                  !formKey1.currentState
                                                      .validate()) {
                                                return;
                                              }
                                            },
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Client First Name',
                                              hintText:
                                                  'Enter client\'s first name here...',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (val) {
                                              if (val == null || val.isEmpty) {
                                                return 'Field is required';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 2, 0),
                                          child: StreamBuilder<
                                              List<LocationsRecord>>(
                                            stream: queryLocationsRecord(
                                              queryBuilder: (locationsRecord) =>
                                                  locationsRecord.where(
                                                      'business_id',
                                                      isEqualTo: valueOrDefault(
                                                          currentUserDocument
                                                              ?.businessId,
                                                          '')),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<LocationsRecord>
                                                  numberDropDown1LocationsRecordList =
                                                  snapshot.data;
                                              return FlutterFlowDropDown(
                                                options:
                                                    numberDropDown1LocationsRecordList
                                                        .map((e) => e.address)
                                                        .toList()
                                                        .toList(),
                                                onChanged: (val) => setState(
                                                    () => numberDropDown1Value =
                                                        val),
                                                width: 180,
                                                height: 50,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'San Francisco Pro',
                                                          color: Colors.black,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText:
                                                    'Please select location...',
                                                fillColor: Colors.white,
                                                elevation: 2,
                                                borderColor: Colors.black,
                                                borderWidth: 0,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((numberDropDown1Value != null &&
                                          numberDropDown1Value != ''))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 2, 0),
                                            child: StreamBuilder<
                                                List<BusinessReviewRecord>>(
                                              stream: queryBusinessReviewRecord(
                                                queryBuilder: (businessReviewRecord) =>
                                                    businessReviewRecord
                                                        .where('location_id',
                                                            isEqualTo:
                                                                numberDropDown1Value)
                                                        .where('business_id',
                                                            isEqualTo: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.businessId,
                                                                '')),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<BusinessReviewRecord>
                                                    numberDropDown2BusinessReviewRecordList =
                                                    snapshot.data;
                                                return FlutterFlowDropDown(
                                                  options:
                                                      numberDropDown2BusinessReviewRecordList
                                                          .map(
                                                              (e) => e.siteType)
                                                          .toList()
                                                          .toList(),
                                                  onChanged: (val) => setState(
                                                      () =>
                                                          numberDropDown2Value =
                                                              val),
                                                  width: 180,
                                                  height: 50,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'San Francisco Pro',
                                                        color: Colors.black,
                                                        useGoogleFonts: false,
                                                      ),
                                                  hintText:
                                                      'Please select review site...',
                                                  fillColor: Colors.white,
                                                  elevation: 2,
                                                  borderColor: Colors.black,
                                                  borderWidth: 0,
                                                  borderRadius: 8,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(12, 4, 12, 4),
                                                  hidesUnderline: true,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if ((valueOrDefault(
                                        currentUserDocument?.userType, '')) ==
                                    'Owner')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord
                                                .where('business_id',
                                                    isEqualTo: valueOrDefault(
                                                        currentUserDocument
                                                            ?.businessId,
                                                        ''))
                                                .where('user_type',
                                                    isEqualTo: 'Owner'),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord> rowUsersRecordList =
                                            snapshot.data;
                                        final rowUsersRecord =
                                            rowUsersRecordList.isNotEmpty
                                                ? rowUsersRecordList.first
                                                : null;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Color(0xFF95A1AC),
                                                ),
                                                child: CheckboxListTile(
                                                  value:
                                                      checkboxListTileValue1 ??=
                                                          rowUsersRecord
                                                              .solicited,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxListTileValue1 =
                                                              newValue),
                                                  title: Text(
                                                    'Solicit Employee Feedback',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .white,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  solicited:
                                                      checkboxListTileValue1,
                                                );
                                                await rowUsersRecord.reference
                                                    .update(usersUpdateData);
                                              },
                                              text: 'Save',
                                              options: FFButtonOptions(
                                                width: 75,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'San Francisco Pro',
                                                          color: Colors.white,
                                                          useGoogleFonts: false,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                StreamBuilder<List<BusinessDetailsRecord>>(
                                  stream: queryBusinessDetailsRecord(
                                    queryBuilder: (businessDetailsRecord) =>
                                        businessDetailsRecord.where('type',
                                            isEqualTo: 'sms'),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<BusinessDetailsRecord>
                                        rowBusinessDetailsRecordList =
                                        snapshot.data;
                                    final rowBusinessDetailsRecord =
                                        rowBusinessDetailsRecordList.isNotEmpty
                                            ? rowBusinessDetailsRecordList.first
                                            : null;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 0),
                                          child: StreamBuilder<
                                              List<BusinessReviewRecord>>(
                                            stream: queryBusinessReviewRecord(
                                              queryBuilder: (businessReviewRecord) =>
                                                  businessReviewRecord
                                                      .where('business_id',
                                                          isEqualTo: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.businessId,
                                                              ''))
                                                      .where('location_id',
                                                          isEqualTo:
                                                              numberDropDown1Value)
                                                      .where('site_type',
                                                          isEqualTo:
                                                              numberDropDown2Value),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BusinessReviewRecord>
                                                  containerBusinessReviewRecordList =
                                                  snapshot.data;
                                              final containerBusinessReviewRecord =
                                                  containerBusinessReviewRecordList
                                                          .isNotEmpty
                                                      ? containerBusinessReviewRecordList
                                                          .first
                                                      : null;
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                ),
                                                child: StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) => usersRecord
                                                        .where('business_id',
                                                            isEqualTo: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.businessId,
                                                                ''))
                                                        .where('user_type',
                                                            isEqualTo: 'Owner'),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        buttonUsersRecordList =
                                                        snapshot.data;
                                                    final buttonUsersRecord =
                                                        buttonUsersRecordList
                                                                .isNotEmpty
                                                            ? buttonUsersRecordList
                                                                .first
                                                            : null;
                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        if (formKey1.currentState ==
                                                                null ||
                                                            !formKey1
                                                                .currentState
                                                                .validate()) {
                                                          return;
                                                        }

                                                        setState(() => FFAppState()
                                                                .reviewLink =
                                                            'https://review-requester.web.app/?location=${numberDropDown1Value}&user_id=${currentUserUid}');
                                                        url = await actions
                                                            .shortUrl(
                                                          containerBusinessReviewRecord
                                                              .siteUrl,
                                                        );
                                                        if ((buttonUsersRecord
                                                                .solicited) ==
                                                            true) {
                                                          reviewLinkRemove =
                                                              await actions
                                                                  .webSpaceRemove(
                                                            FFAppState()
                                                                .reviewLink,
                                                          );
                                                          reviewLink =
                                                              await actions
                                                                  .shortUrl(
                                                            reviewLinkRemove,
                                                          );
                                                          numberMessage1 =
                                                              await actions
                                                                  .stringReplace(
                                                            rowBusinessDetailsRecord
                                                                .solicited,
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.businessName,
                                                                ''),
                                                            numberFullNameController
                                                                .text,
                                                            url,
                                                            reviewLinkRemove,
                                                          );
                                                          setState(() => FFAppState()
                                                                  .sendMessage =
                                                              numberMessage1);
                                                        } else {
                                                          numberMessage2 =
                                                              await actions
                                                                  .stringReplace(
                                                            rowBusinessDetailsRecord
                                                                .notSolicited,
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.businessName,
                                                                ''),
                                                            numberFullNameController
                                                                .text,
                                                            url,
                                                            '  ',
                                                          );
                                                          setState(() => FFAppState()
                                                                  .sendMessage =
                                                              numberMessage2);
                                                        }

                                                        if ((buttonUsersRecord
                                                                .numberRequests) !=
                                                            0) {
                                                          if ((valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userType,
                                                                  '')) ==
                                                              'Employee') {
                                                            final sendRequestsCreateData =
                                                                createSendRequestsRecordData(
                                                              clientName:
                                                                  numberFullNameController
                                                                      .text,
                                                              message: FFAppState()
                                                                  .sendMessage,
                                                              clientNumber:
                                                                  '${FFAppState().countryCode}${phoneNumberController.text}',
                                                              businessId: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.businessId,
                                                                  ''),
                                                              sendTime:
                                                                  getCurrentTimestamp,
                                                              senderName:
                                                                  currentUserDisplayName,
                                                              senderUid:
                                                                  columnEmployeeRecord
                                                                      .employeeUid,
                                                            );
                                                            await SendRequestsRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    sendRequestsCreateData);
                                                          } else {
                                                            final sendRequestsCreateData =
                                                                createSendRequestsRecordData(
                                                              clientName:
                                                                  numberFullNameController
                                                                      .text,
                                                              message: FFAppState()
                                                                  .sendMessage,
                                                              clientNumber:
                                                                  '${FFAppState().countryCode}${phoneNumberController.text}',
                                                              businessId: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.businessId,
                                                                  ''),
                                                              sendTime:
                                                                  getCurrentTimestamp,
                                                              senderName:
                                                                  currentUserDisplayName,
                                                            );
                                                            await SendRequestsRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    sendRequestsCreateData);
                                                          }

                                                          await actions
                                                              .sendTwilioSMS(
                                                            '${FFAppState().countryCode}${phoneNumberController.text}',
                                                            FFAppState()
                                                                .sendMessage,
                                                          );

                                                          final usersUpdateData =
                                                              {
                                                            'number_requests':
                                                                FieldValue
                                                                    .increment(
                                                                        -(1)),
                                                          };
                                                          await buttonUsersRecord
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                          setState(() {
                                                            numberFullNameController
                                                                ?.clear();
                                                            phoneNumberController
                                                                ?.clear();
                                                          });
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Message is sent successfully',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1,
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                        } else {
                                                          if ((valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userType,
                                                                  '')) ==
                                                              'Owner') {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      BuySubscriptionWidget(),
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'All requests are used, tell your owner to purchase new requests.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        10000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0x00000000),
                                                              ),
                                                            );
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: 'Send Message',
                                                      options: FFButtonOptions(
                                                        width: 200,
                                                        height: 50,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'San Francisco Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 3,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'By using our app to send an SMS to a customer, you acknowledge that you have obtained their consent to receive this text message',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'San Francisco Pro',
                                          fontStyle: FontStyle.italic,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 36),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<EmployeeRecord>>(
                        stream: queryEmployeeRecord(
                          queryBuilder: (employeeRecord) =>
                              employeeRecord.where('business_id',
                                  isEqualTo: valueOrDefault(
                                      currentUserDocument?.businessId, '')),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<EmployeeRecord> columnEmployeeRecordList =
                              snapshot.data;
                          final columnEmployeeRecord =
                              columnEmployeeRecordList.isNotEmpty
                                  ? columnEmployeeRecordList.first
                                  : null;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((valueOrDefault(
                                        currentUserDocument?.userType, '')) !=
                                    'Employee')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Number of Email Review Requests Left',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      'San Francisco Pro',
                                                  fontSize: 18,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) => usersRecord
                                                    .where('business_id',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.businessId,
                                                            ''))
                                                    .where('user_type',
                                                        isEqualTo: 'Owner'),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    textUsersRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final textUsersRecord =
                                                    textUsersRecordList
                                                            .isNotEmpty
                                                        ? textUsersRecordList
                                                            .first
                                                        : null;
                                                return Text(
                                                  textUsersRecord.numberRequests
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Form(
                                  key: formKey2,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: TextFormField(
                                            controller: emailFullNameController,
                                            onFieldSubmitted: (_) async {
                                              if (formKey1.currentState ==
                                                      null ||
                                                  !formKey1.currentState
                                                      .validate()) {
                                                return;
                                              }
                                            },
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Client First Name',
                                              hintText:
                                                  'Enter first name here...',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (val) {
                                              if (val == null || val.isEmpty) {
                                                return 'Field is required';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 10, 0),
                                          child: TextFormField(
                                            controller: clientemailController,
                                            onFieldSubmitted: (_) async {
                                              if (formKey1.currentState ==
                                                      null ||
                                                  !formKey1.currentState
                                                      .validate()) {
                                                return;
                                              }
                                            },
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Client  Email',
                                              hintText: 'Enter email here...',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (val) {
                                              if (val == null || val.isEmpty) {
                                                return 'Field is required';
                                              }

                                              if (!RegExp(
                                                      kTextValidatorEmailRegex)
                                                  .hasMatch(val)) {
                                                return 'Has to be a valid email address.';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: StreamBuilder<
                                              List<LocationsRecord>>(
                                            stream: queryLocationsRecord(
                                              queryBuilder: (locationsRecord) =>
                                                  locationsRecord.where(
                                                      'business_id',
                                                      isEqualTo: valueOrDefault(
                                                          currentUserDocument
                                                              ?.businessId,
                                                          '')),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<LocationsRecord>
                                                  emailDropDown1LocationsRecordList =
                                                  snapshot.data;
                                              return FlutterFlowDropDown(
                                                initialOption:
                                                    emailDropDown1Value ??=
                                                        FFAppState().location,
                                                options:
                                                    emailDropDown1LocationsRecordList
                                                        .map((e) => e.address)
                                                        .toList()
                                                        .toList(),
                                                onChanged: (val) => setState(
                                                    () => emailDropDown1Value =
                                                        val),
                                                width: 180,
                                                height: 50,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'San Francisco Pro',
                                                          color: Colors.black,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText:
                                                    'Please select location...',
                                                fillColor: Colors.white,
                                                elevation: 2,
                                                borderColor: Colors.black,
                                                borderWidth: 0,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((emailDropDown1Value != null &&
                                          emailDropDown1Value != ''))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: StreamBuilder<
                                                List<BusinessReviewRecord>>(
                                              stream: queryBusinessReviewRecord(
                                                queryBuilder: (businessReviewRecord) =>
                                                    businessReviewRecord
                                                        .where('business_id',
                                                            isEqualTo: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.businessId,
                                                                ''))
                                                        .where('location_id',
                                                            isEqualTo:
                                                                emailDropDown1Value),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<BusinessReviewRecord>
                                                    emailDropDown2BusinessReviewRecordList =
                                                    snapshot.data;
                                                return FlutterFlowDropDown(
                                                  options:
                                                      emailDropDown2BusinessReviewRecordList
                                                          .map(
                                                              (e) => e.siteType)
                                                          .toList()
                                                          .toList(),
                                                  onChanged: (val) => setState(
                                                      () =>
                                                          emailDropDown2Value =
                                                              val),
                                                  width: 180,
                                                  height: 50,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'San Francisco Pro',
                                                        color: Colors.black,
                                                        useGoogleFonts: false,
                                                      ),
                                                  hintText:
                                                      'Please select review site...',
                                                  fillColor: Colors.white,
                                                  elevation: 2,
                                                  borderColor: Colors.black,
                                                  borderWidth: 0,
                                                  borderRadius: 8,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(12, 4, 12, 4),
                                                  hidesUnderline: true,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if ((valueOrDefault(
                                        currentUserDocument?.userType, '')) ==
                                    'Owner')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord
                                                .where('business_id',
                                                    isEqualTo: valueOrDefault(
                                                        currentUserDocument
                                                            ?.businessId,
                                                        ''))
                                                .where('user_type',
                                                    isEqualTo: 'Owner'),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord> rowUsersRecordList =
                                            snapshot.data;
                                        final rowUsersRecord =
                                            rowUsersRecordList.isNotEmpty
                                                ? rowUsersRecordList.first
                                                : null;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Color(0xFF95A1AC),
                                                ),
                                                child: CheckboxListTile(
                                                  value:
                                                      checkboxListTileValue2 ??=
                                                          rowUsersRecord
                                                              .solicited,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxListTileValue2 =
                                                              newValue),
                                                  title: Text(
                                                    'Solicit Employee Feedback',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .white,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  solicited:
                                                      checkboxListTileValue2,
                                                );
                                                await rowUsersRecord.reference
                                                    .update(usersUpdateData);
                                              },
                                              text: 'Save',
                                              options: FFButtonOptions(
                                                width: 75,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'San Francisco Pro',
                                                          color: Colors.white,
                                                          useGoogleFonts: false,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                StreamBuilder<List<BusinessDetailsRecord>>(
                                  stream: queryBusinessDetailsRecord(
                                    queryBuilder: (businessDetailsRecord) =>
                                        businessDetailsRecord.where('type',
                                            isEqualTo: 'email'),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<BusinessDetailsRecord>
                                        rowBusinessDetailsRecordList =
                                        snapshot.data;
                                    final rowBusinessDetailsRecord =
                                        rowBusinessDetailsRecordList.isNotEmpty
                                            ? rowBusinessDetailsRecordList.first
                                            : null;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 0),
                                          child: StreamBuilder<
                                              List<BusinessReviewRecord>>(
                                            stream: queryBusinessReviewRecord(
                                              queryBuilder: (businessReviewRecord) =>
                                                  businessReviewRecord
                                                      .where('business_id',
                                                          isEqualTo: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.businessId,
                                                              ''))
                                                      .where('location_id',
                                                          isEqualTo:
                                                              emailDropDown1Value)
                                                      .where('site_type',
                                                          isEqualTo:
                                                              emailDropDown2Value),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BusinessReviewRecord>
                                                  containerBusinessReviewRecordList =
                                                  snapshot.data;
                                              final containerBusinessReviewRecord =
                                                  containerBusinessReviewRecordList
                                                          .isNotEmpty
                                                      ? containerBusinessReviewRecordList
                                                          .first
                                                      : null;
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                ),
                                                child: StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) => usersRecord
                                                        .where('business_id',
                                                            isEqualTo: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.businessId,
                                                                ''))
                                                        .where('user_type',
                                                            isEqualTo: 'Owner'),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        buttonUsersRecordList =
                                                        snapshot.data;
                                                    // Return an empty Container when the document does not exist.
                                                    if (snapshot.data.isEmpty) {
                                                      return Container();
                                                    }
                                                    final buttonUsersRecord =
                                                        buttonUsersRecordList
                                                                .isNotEmpty
                                                            ? buttonUsersRecordList
                                                                .first
                                                            : null;
                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        if (formKey2.currentState ==
                                                                null ||
                                                            !formKey2
                                                                .currentState
                                                                .validate()) {
                                                          return;
                                                        }

                                                        setState(() => FFAppState()
                                                                .reviewLink =
                                                            'https://review-requester.web.app/?location=${emailDropDown1Value}&user_id=${currentUserUid}');
                                                        emailUrl = await actions
                                                            .shortUrl(
                                                          containerBusinessReviewRecord
                                                              .siteUrl,
                                                        );
                                                        if ((buttonUsersRecord
                                                                .solicited) ==
                                                            true) {
                                                          reviewLinkRemoveEmail =
                                                              await actions
                                                                  .webSpaceRemove(
                                                            FFAppState()
                                                                .reviewLink,
                                                          );
                                                          reviewLinkEmail =
                                                              await actions
                                                                  .shortUrl(
                                                            reviewLinkRemoveEmail,
                                                          );
                                                          emailMessage1 =
                                                              await actions
                                                                  .stringReplace(
                                                            rowBusinessDetailsRecord
                                                                .solicited,
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.businessName,
                                                                ''),
                                                            emailFullNameController
                                                                .text,
                                                            emailUrl,
                                                            reviewLinkRemoveEmail,
                                                          );
                                                          setState(() => FFAppState()
                                                                  .sendMessage =
                                                              emailMessage1);
                                                        } else {
                                                          emailMessage2 =
                                                              await actions
                                                                  .stringReplace(
                                                            rowBusinessDetailsRecord
                                                                .notSolicited,
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.businessName,
                                                                ''),
                                                            emailFullNameController
                                                                .text,
                                                            emailUrl,
                                                            'You can type STOP to stop getting messages from here. {{{ pm:unsubscribe }}}',
                                                          );
                                                          setState(() => FFAppState()
                                                                  .sendMessage =
                                                              emailMessage2);
                                                        }

                                                        if ((buttonUsersRecord
                                                                .phoneNumber) !=
                                                            '0') {
                                                          if ((valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userType,
                                                                  '')) ==
                                                              'Employee') {
                                                            final sendRequestsCreateData =
                                                                createSendRequestsRecordData(
                                                              clientName:
                                                                  numberFullNameController
                                                                      .text,
                                                              message: FFAppState()
                                                                  .sendMessage,
                                                              businessId: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.businessId,
                                                                  ''),
                                                              sendTime:
                                                                  getCurrentTimestamp,
                                                              senderName:
                                                                  currentUserDisplayName,
                                                              senderUid:
                                                                  columnEmployeeRecord
                                                                      .employeeUid,
                                                            );
                                                            await SendRequestsRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    sendRequestsCreateData);
                                                          } else {
                                                            final sendRequestsCreateData =
                                                                createSendRequestsRecordData(
                                                              clientName:
                                                                  numberFullNameController
                                                                      .text,
                                                              message: FFAppState()
                                                                  .sendMessage,
                                                              businessId: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.businessId,
                                                                  ''),
                                                              sendTime:
                                                                  getCurrentTimestamp,
                                                              senderName:
                                                                  currentUserDisplayName,
                                                              clientEmail:
                                                                  clientemailController
                                                                      .text,
                                                            );
                                                            await SendRequestsRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    sendRequestsCreateData);
                                                          }

                                                          final usersUpdateData =
                                                              {
                                                            'number_requests':
                                                                FieldValue
                                                                    .increment(
                                                                        -(1)),
                                                          };
                                                          await buttonUsersRecord
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                          await SendEmailReqestsCall
                                                              .call(
                                                            clientEmail:
                                                                clientemailController
                                                                    .text,
                                                            message: FFAppState()
                                                                .sendMessage,
                                                          );
                                                          setState(() {
                                                            phoneNumberController
                                                                ?.clear();
                                                            numberFullNameController
                                                                ?.clear();
                                                          });
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Email is sent successfully',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1,
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    BuySubscriptionWidget(),
                                                              );
                                                            },
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: 'Send Message',
                                                      options: FFButtonOptions(
                                                        width: 200,
                                                        height: 50,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'San Francisco Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 3,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'By using our app to send an email to a customer, you acknowledge that you have obtained their consent to receive this communication',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'San Francisco Pro',
                                          fontStyle: FontStyle.italic,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
