import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuySubscriptionPlanWidget extends StatefulWidget {
  const BuySubscriptionPlanWidget({Key key}) : super(key: key);

  @override
  _BuySubscriptionPlanWidgetState createState() =>
      _BuySubscriptionPlanWidgetState();
}

class _BuySubscriptionPlanWidgetState extends State<BuySubscriptionPlanWidget> {
  DateTime date1;
  bool purchaseExist1;
  bool getRequests;
  int addReqeusts;
  bool purchaseNew1;
  DateTime date2;
  bool purchaseExist2;
  bool getRequests2;
  int addReqeusts2;
  bool purchaseNew2;
  DateTime date3;
  bool purchaseExist3;
  bool getRequests3;
  int addReqeusts3;
  bool purchaseNew3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Buy Subscription Plan',
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: AuthUserStreamWidget(
              child: StreamBuilder<List<BuyPlanRecord>>(
                stream: queryBuyPlanRecord(
                  queryBuilder: (buyPlanRecord) => buyPlanRecord.where(
                      'business_id',
                      isEqualTo:
                          valueOrDefault(currentUserDocument?.businessId, '')),
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<BuyPlanRecord> columnBuyPlanRecordList = snapshot.data;
                  final columnBuyPlanRecord = columnBuyPlanRecordList.isNotEmpty
                      ? columnBuyPlanRecordList.first
                      : null;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'The subscriptions below are all monthly and not on contract. As well, requests do not roll over to the next month. For more information please see the FAQs section in the Settings tab. ',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tier 1',
                                        style:
                                            FlutterFlowTheme.of(context).title2,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Text(
                                          revenue_cat.offerings.current.monthly
                                              .product.description,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      revenue_cat.offerings.current.monthly
                                          .product.priceString,
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          date1 = await actions.dateExpire();
                                          if (columnBuyPlanRecord != null) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Notice'),
                                                          content: Text(
                                                              'you have already existing plan running.existing plan\'s benifit\'s will be removed if you purchase new plan.\n'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              purchaseExist1 = await revenue_cat
                                                  .purchasePackage(revenue_cat
                                                      .offerings
                                                      .current
                                                      .monthly
                                                      .identifier);
                                              if (purchaseExist1) {
                                                getRequests =
                                                    await actions.getRequests(
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.numberRequests,
                                                      0),
                                                  columnBuyPlanRecord.oldReview,
                                                );
                                                if ((getRequests) == true) {
                                                  addReqeusts =
                                                      await actions.addRequests(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.numberRequests,
                                                        0),
                                                    columnBuyPlanRecord
                                                        .oldReview,
                                                    30,
                                                  );

                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    numberRequests: addReqeusts,
                                                  );
                                                  await currentUserReference
                                                      .update(usersUpdateData);
                                                } else {
                                                  final buyPlanUpdateData =
                                                      createBuyPlanRecordData(
                                                    planType: '\$15/mo',
                                                    buyDate:
                                                        getCurrentTimestamp,
                                                    expireDate:
                                                        date1.toString(),
                                                    oldReview: 0,
                                                  );
                                                  await columnBuyPlanRecord
                                                      .reference
                                                      .update(
                                                          buyPlanUpdateData);

                                                  final usersUpdateData = {
                                                    'number_requests':
                                                        FieldValue.increment(
                                                            30),
                                                  };
                                                  await currentUserReference
                                                      .update(usersUpdateData);
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'There is something wrong',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0x00000000),
                                                  ),
                                                );
                                              }
                                            } else {
                                              Navigator.pop(context);
                                            }
                                          } else {
                                            purchaseNew1 = await revenue_cat
                                                .purchasePackage(revenue_cat
                                                    .offerings
                                                    .current
                                                    .monthly
                                                    .identifier);
                                            if (purchaseNew1) {
                                              final buyPlanCreateData =
                                                  createBuyPlanRecordData(
                                                businessId: valueOrDefault(
                                                    currentUserDocument
                                                        ?.businessId,
                                                    ''),
                                                planType: '\$15/mo',
                                                buyDate: getCurrentTimestamp,
                                                expireDate: date1.toString(),
                                                oldReview: valueOrDefault(
                                                    currentUserDocument
                                                        ?.numberRequests,
                                                    0),
                                              );
                                              await BuyPlanRecord.collection
                                                  .doc()
                                                  .set(buyPlanCreateData);

                                              final usersUpdateData = {
                                                'number_requests':
                                                    FieldValue.increment(30),
                                              };
                                              await currentUserReference
                                                  .update(usersUpdateData);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'There is something wrong',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                ),
                                              );
                                            }
                                          }

                                          setState(() {});
                                        },
                                        text: 'Active',
                                        options: FFButtonOptions(
                                          width: 80,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tier 2',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'San Francisco Pro',
                                                fontSize: 26,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Text(
                                            revenue_cat.offerings.current
                                                .getPackage('pro')
                                                .product
                                                .description,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        revenue_cat.offerings.current
                                            .getPackage('pro')
                                            .product
                                            .priceString,
                                        style:
                                            FlutterFlowTheme.of(context).title2,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            date2 = await actions.dateExpire();
                                            if (columnBuyPlanRecord != null) {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Notice'),
                                                            content: Text(
                                                                'you have already exisitng plan running.existing plan\'s benifit\'s will be removed if you purchase new plan.\n'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Confirm'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                purchaseExist2 =
                                                    await revenue_cat
                                                        .purchasePackage(
                                                            revenue_cat
                                                                .offerings
                                                                .current
                                                                .getPackage(
                                                                    'pro')
                                                                .identifier);
                                                if (purchaseExist2) {
                                                  getRequests2 =
                                                      await actions.getRequests(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.numberRequests,
                                                        0),
                                                    columnBuyPlanRecord
                                                        .oldReview,
                                                  );
                                                  if ((getRequests2) == true) {
                                                    addReqeusts2 = await actions
                                                        .addRequests(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.numberRequests,
                                                          0),
                                                      columnBuyPlanRecord
                                                          .oldReview,
                                                      100,
                                                    );

                                                    final usersUpdateData =
                                                        createUsersRecordData(
                                                      numberRequests:
                                                          addReqeusts2,
                                                    );
                                                    await currentUserReference
                                                        .update(
                                                            usersUpdateData);

                                                    final buyPlanUpdateData =
                                                        createBuyPlanRecordData(
                                                      planType: '\$40/mo',
                                                      buyDate:
                                                          getCurrentTimestamp,
                                                      expireDate:
                                                          date2.toString(),
                                                      oldReview: 0,
                                                    );
                                                    await columnBuyPlanRecord
                                                        .reference
                                                        .update(
                                                            buyPlanUpdateData);
                                                  } else {
                                                    final buyPlanUpdateData =
                                                        createBuyPlanRecordData(
                                                      planType: '\$15/mo',
                                                      buyDate:
                                                          getCurrentTimestamp,
                                                      expireDate:
                                                          date2.toString(),
                                                      oldReview: 0,
                                                    );
                                                    await columnBuyPlanRecord
                                                        .reference
                                                        .update(
                                                            buyPlanUpdateData);

                                                    final usersUpdateData = {
                                                      'number_requests':
                                                          FieldValue.increment(
                                                              30),
                                                    };
                                                    await currentUserReference
                                                        .update(
                                                            usersUpdateData);
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'There is something wrong',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                    ),
                                                  );
                                                }
                                              } else {
                                                Navigator.pop(context);
                                              }
                                            } else {
                                              purchaseNew2 = await revenue_cat
                                                  .purchasePackage(revenue_cat
                                                      .offerings.current
                                                      .getPackage('pro')
                                                      .identifier);
                                              if (purchaseNew2) {
                                                final buyPlanCreateData =
                                                    createBuyPlanRecordData(
                                                  businessId: valueOrDefault(
                                                      currentUserDocument
                                                          ?.businessId,
                                                      ''),
                                                  planType: '\$40/mo',
                                                  buyDate: getCurrentTimestamp,
                                                  expireDate: date2.toString(),
                                                  oldReview: valueOrDefault(
                                                      currentUserDocument
                                                          ?.numberRequests,
                                                      0),
                                                );
                                                await BuyPlanRecord.collection
                                                    .doc()
                                                    .set(buyPlanCreateData);

                                                final usersUpdateData = {
                                                  'number_requests':
                                                      FieldValue.increment(100),
                                                };
                                                await currentUserReference
                                                    .update(usersUpdateData);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'There is something wrong',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0x00000000),
                                                  ),
                                                );
                                              }
                                            }

                                            setState(() {});
                                          },
                                          text: 'Active',
                                          options: FFButtonOptions(
                                            width: 80,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tier 3',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'San Francisco Pro',
                                                fontSize: 26,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Text(
                                            revenue_cat.offerings.current
                                                .getPackage('500')
                                                .product
                                                .description,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        revenue_cat.offerings.current
                                            .getPackage('500')
                                            .product
                                            .priceString,
                                        style:
                                            FlutterFlowTheme.of(context).title2,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            date3 = await actions.dateExpire();
                                            if (columnBuyPlanRecord != null) {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Notice'),
                                                            content: Text(
                                                                'you have already exisitng plan running.existing plan\'s benifit\'s will be removed if you purchase new plan.\n'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Confirm'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                purchaseExist3 =
                                                    await revenue_cat
                                                        .purchasePackage(
                                                            revenue_cat
                                                                .offerings
                                                                .current
                                                                .getPackage(
                                                                    '500')
                                                                .identifier);
                                                if (purchaseExist3) {
                                                  getRequests3 =
                                                      await actions.getRequests(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.numberRequests,
                                                        0),
                                                    columnBuyPlanRecord
                                                        .oldReview,
                                                  );
                                                  if ((getRequests3) == true) {
                                                    addReqeusts3 = await actions
                                                        .addRequests(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.numberRequests,
                                                          0),
                                                      columnBuyPlanRecord
                                                          .oldReview,
                                                      500,
                                                    );

                                                    final usersUpdateData =
                                                        createUsersRecordData(
                                                      numberRequests:
                                                          addReqeusts3,
                                                    );
                                                    await currentUserReference
                                                        .update(
                                                            usersUpdateData);

                                                    final buyPlanUpdateData =
                                                        createBuyPlanRecordData(
                                                      planType: '\$175/mo',
                                                      buyDate:
                                                          getCurrentTimestamp,
                                                      expireDate:
                                                          date2.toString(),
                                                    );
                                                    await columnBuyPlanRecord
                                                        .reference
                                                        .update(
                                                            buyPlanUpdateData);
                                                  } else {
                                                    final buyPlanUpdateData =
                                                        createBuyPlanRecordData(
                                                      planType: '\$175/mo',
                                                      buyDate:
                                                          getCurrentTimestamp,
                                                      expireDate:
                                                          date3.toString(),
                                                      oldReview: 0,
                                                    );
                                                    await columnBuyPlanRecord
                                                        .reference
                                                        .update(
                                                            buyPlanUpdateData);

                                                    final usersUpdateData = {
                                                      'number_requests':
                                                          FieldValue.increment(
                                                              500),
                                                    };
                                                    await currentUserReference
                                                        .update(
                                                            usersUpdateData);
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'There is something wrong',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                    ),
                                                  );
                                                }
                                              } else {
                                                Navigator.pop(context);
                                              }
                                            } else {
                                              purchaseNew3 = await revenue_cat
                                                  .purchasePackage(revenue_cat
                                                      .offerings.current
                                                      .getPackage('500')
                                                      .identifier);
                                              if (purchaseNew3) {
                                                final buyPlanCreateData =
                                                    createBuyPlanRecordData(
                                                  businessId: valueOrDefault(
                                                      currentUserDocument
                                                          ?.businessId,
                                                      ''),
                                                  planType: '\$175/mo',
                                                  buyDate: getCurrentTimestamp,
                                                  expireDate: date3.toString(),
                                                  oldReview: valueOrDefault(
                                                      currentUserDocument
                                                          ?.numberRequests,
                                                      0),
                                                );
                                                await BuyPlanRecord.collection
                                                    .doc()
                                                    .set(buyPlanCreateData);

                                                final usersUpdateData = {
                                                  'number_requests':
                                                      FieldValue.increment(500),
                                                };
                                                await currentUserReference
                                                    .update(usersUpdateData);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'There is something wrong',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0x00000000),
                                                  ),
                                                );
                                              }
                                            }

                                            setState(() {});
                                          },
                                          text: 'Active',
                                          options: FFButtonOptions(
                                            width: 80,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
        ),
      ),
    );
  }
}
