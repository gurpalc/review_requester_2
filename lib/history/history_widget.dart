import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../customer_feedback/customer_feedback_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../history_details/history_details_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({Key key}) : super(key: key);

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'History',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ((valueOrDefault(currentUserDocument?.userType, '')) !=
                  'Employee')
                Expanded(
                  child: AuthUserStreamWidget(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            indicatorColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            tabs: [
                              Tab(
                                text: 'Sent Requests',
                                icon: Icon(
                                  Icons.send,
                                ),
                              ),
                              Tab(
                                text: 'Customer Feedback',
                                icon: Icon(
                                  Icons.feedback,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Visibility(
                                  visible: (valueOrDefault(
                                          currentUserDocument?.userType, '')) ==
                                      'Owner',
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: StreamBuilder<List<EmployeeRecord>>(
                                      stream: queryEmployeeRecord(
                                        queryBuilder: (employeeRecord) =>
                                            employeeRecord.where('business_id',
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
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<EmployeeRecord>
                                            columnEmployeeRecordList =
                                            snapshot.data;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                columnEmployeeRecordList.length,
                                                (columnIndex) {
                                              final columnEmployeeRecord =
                                                  columnEmployeeRecordList[
                                                      columnIndex];
                                              return Container(
                                                color: Colors.white,
                                                child: ExpandableNotifier(
                                                  initialExpanded: false,
                                                  child: ExpandablePanel(
                                                    header: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Text(
                                                        columnEmployeeRecord
                                                            .employeeName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'San Francisco Pro',
                                                                  fontSize: 20,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                    collapsed: Container(
                                                      width: 0,
                                                      height: 0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                      ),
                                                    ),
                                                    expanded: FutureBuilder<
                                                        List<
                                                            SendRequestsRecord>>(
                                                      future:
                                                          querySendRequestsRecordOnce(
                                                        queryBuilder: (sendRequestsRecord) =>
                                                            sendRequestsRecord.where(
                                                                'sender_uid',
                                                                isEqualTo: columnEmployeeRecord
                                                                            .employeeUid !=
                                                                        ''
                                                                    ? columnEmployeeRecord
                                                                        .employeeUid
                                                                    : null),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<SendRequestsRecord>
                                                            columnSendRequestsRecordList =
                                                            snapshot.data;
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                columnSendRequestsRecordList
                                                                    .length,
                                                                (columnIndex) {
                                                              final columnSendRequestsRecord =
                                                                  columnSendRequestsRecordList[
                                                                      columnIndex];
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              HistoryDetailsWidget(
                                                                        historyDetails:
                                                                            columnSendRequestsRecord,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: ListTile(
                                                                  title: Text(
                                                                    columnSendRequestsRecord
                                                                        .clientName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title3,
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    columnSendRequestsRecord
                                                                        .clientNumber,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2,
                                                                  ),
                                                                  trailing:
                                                                      Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right,
                                                                    color: Color(
                                                                        0xFF303030),
                                                                    size: 20,
                                                                  ),
                                                                  tileColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .white,
                                                                  dense: false,
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    theme: ExpandableThemeData(
                                                      tapHeaderToExpand: true,
                                                      tapBodyToExpand: false,
                                                      tapBodyToCollapse: false,
                                                      headerAlignment:
                                                          ExpandablePanelHeaderAlignment
                                                              .center,
                                                      hasIcon: true,
                                                      expandIcon: Icons
                                                          .keyboard_arrow_right,
                                                      collapseIcon: Icons
                                                          .keyboard_arrow_down_outlined,
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              StreamBuilder<
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<LocationsRecord>
                                                      dropDownLocationsRecordList =
                                                      snapshot.data;
                                                  return FlutterFlowDropDown(
                                                    options:
                                                        dropDownLocationsRecordList
                                                            .map((e) =>
                                                                e.address)
                                                            .toList()
                                                            .toList(),
                                                    onChanged: (val) =>
                                                        setState(() =>
                                                            dropDownValue =
                                                                val),
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
                                                        'Please select address...',
                                                    fillColor: Colors.white,
                                                    elevation: 2,
                                                    borderColor: Colors.black,
                                                    borderWidth: 0,
                                                    borderRadius: 10,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 4, 12, 4),
                                                    hidesUnderline: true,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if ((valueOrDefault(
                                              currentUserDocument?.userType,
                                              '')) ==
                                          'Manager')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 20, 10, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                            ),
                                            child: Visibility(
                                              visible: (dropDownValue != null &&
                                                  dropDownValue != ''),
                                              child: StreamBuilder<
                                                  List<CustomerFeedbackRecord>>(
                                                stream:
                                                    queryCustomerFeedbackRecord(
                                                  queryBuilder:
                                                      (customerFeedbackRecord) =>
                                                          customerFeedbackRecord
                                                              .where('location',
                                                                  isEqualTo:
                                                                      dropDownValue),
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
                                                  List<CustomerFeedbackRecord>
                                                      listViewCustomerFeedbackRecordList =
                                                      snapshot.data;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewCustomerFeedbackRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewCustomerFeedbackRecord =
                                                          listViewCustomerFeedbackRecordList[
                                                              listViewIndex];
                                                      return StreamBuilder<
                                                          List<ManagerRecord>>(
                                                        stream:
                                                            queryManagerRecord(
                                                          queryBuilder: (managerRecord) =>
                                                              managerRecord.where(
                                                                  'manager_email',
                                                                  isEqualTo:
                                                                      currentUserEmail),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ManagerRecord>
                                                              containerManagerRecordList =
                                                              snapshot.data;
                                                          final containerManagerRecord =
                                                              containerManagerRecordList
                                                                      .isNotEmpty
                                                                  ? containerManagerRecordList
                                                                      .first
                                                                  : null;
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                            ),
                                                            child: Visibility(
                                                              visible: containerManagerRecord
                                                                      .locationList
                                                                      .toList()
                                                                      ?.contains(
                                                                          dropDownValue) ??
                                                                  true,
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              CustomerFeedbackWidget(
                                                                        customerDetails:
                                                                            listViewCustomerFeedbackRecord,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Slidable(
                                                                  actionPane:
                                                                      const SlidableScrollActionPane(),
                                                                  secondaryActions: [
                                                                    IconSlideAction(
                                                                      caption:
                                                                          'Delete',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      icon: Icons
                                                                          .delete,
                                                                      onTap:
                                                                          () async {
                                                                        await listViewCustomerFeedbackRecord
                                                                            .reference
                                                                            .delete();
                                                                      },
                                                                    ),
                                                                  ],
                                                                  child:
                                                                      ListTile(
                                                                    title: Text(
                                                                      listViewCustomerFeedbackRecord
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title3,
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      listViewCustomerFeedbackRecord
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2,
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: Color(
                                                                          0xFF303030),
                                                                      size: 20,
                                                                    ),
                                                                    tileColor:
                                                                        Color(
                                                                            0xFFF5F5F5),
                                                                    dense:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      if ((valueOrDefault(
                                              currentUserDocument?.userType,
                                              '')) ==
                                          'Owner')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 20, 10, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: Visibility(
                                              visible: (dropDownValue != null &&
                                                  dropDownValue != ''),
                                              child: StreamBuilder<
                                                  List<CustomerFeedbackRecord>>(
                                                stream:
                                                    queryCustomerFeedbackRecord(
                                                  queryBuilder:
                                                      (customerFeedbackRecord) =>
                                                          customerFeedbackRecord
                                                              .where('location',
                                                                  isEqualTo:
                                                                      dropDownValue),
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
                                                  List<CustomerFeedbackRecord>
                                                      listViewCustomerFeedbackRecordList =
                                                      snapshot.data;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewCustomerFeedbackRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewCustomerFeedbackRecord =
                                                          listViewCustomerFeedbackRecordList[
                                                              listViewIndex];
                                                      return InkWell(
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  CustomerFeedbackWidget(
                                                                customerDetails:
                                                                    listViewCustomerFeedbackRecord,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Slidable(
                                                          actionPane:
                                                              const SlidableScrollActionPane(),
                                                          secondaryActions: [
                                                            IconSlideAction(
                                                              caption: 'Delete',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              icon:
                                                                  Icons.delete,
                                                              onTap: () async {
                                                                await listViewCustomerFeedbackRecord
                                                                    .reference
                                                                    .delete();
                                                              },
                                                            ),
                                                          ],
                                                          child: ListTile(
                                                            title: Text(
                                                              listViewCustomerFeedbackRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                            subtitle: Text(
                                                              listViewCustomerFeedbackRecord
                                                                  .number,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle2,
                                                            ),
                                                            trailing: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: Color(
                                                                  0xFF303030),
                                                              size: 20,
                                                            ),
                                                            tileColor: Color(
                                                                0xFFF5F5F5),
                                                            dense: false,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if ((valueOrDefault(currentUserDocument?.userType, '')) ==
                  'Employee')
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: AuthUserStreamWidget(
                    child: Text(
                      'This page is only for owner and manager',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'San Francisco Pro',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
