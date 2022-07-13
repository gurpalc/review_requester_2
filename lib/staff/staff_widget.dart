import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_employees_widget.dart';
import '../components/add_managers_widget.dart';
import '../employee_details/employee_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../manager_details/manager_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffWidget extends StatefulWidget {
  const StaffWidget({Key key}) : super(key: key);

  @override
  _StaffWidgetState createState() => _StaffWidgetState();
}

class _StaffWidgetState extends State<StaffWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Staff',
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
                              labelStyle:
                                  FlutterFlowTheme.of(context).subtitle1,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              tabs: [
                                InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: AddEmployeesWidget(),
                                        );
                                      },
                                    );
                                  },
                                  child: Tab(
                                    text: 'Employees',
                                    icon: Icon(
                                      Icons.add_circle,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: AddManagersWidget(),
                                        );
                                      },
                                    );
                                  },
                                  child: Tab(
                                    text: 'Managers',
                                    icon: Icon(
                                      Icons.add_circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  StreamBuilder<List<EmployeeRecord>>(
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
                                          listViewEmployeeRecordList =
                                          snapshot.data;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewEmployeeRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewEmployeeRecord =
                                              listViewEmployeeRecordList[
                                                  listViewIndex];
                                          return InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EmployeeDetailsWidget(
                                                    employeeDetails:
                                                        listViewEmployeeRecord,
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
                                                  color: Color(0xFFF32145),
                                                  icon: Icons.delete,
                                                  onTap: () async {
                                                    await listViewEmployeeRecord
                                                        .reference
                                                        .delete();
                                                  },
                                                ),
                                              ],
                                              child: ListTile(
                                                title: Text(
                                                  listViewEmployeeRecord
                                                      .employeeName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF303030),
                                                  size: 20,
                                                ),
                                                tileColor: Color(0xFFF5F5F5),
                                                dense: false,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  StreamBuilder<List<ManagerRecord>>(
                                    stream: queryManagerRecord(
                                      queryBuilder: (managerRecord) =>
                                          managerRecord.where('business_id',
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
                                      List<ManagerRecord>
                                          listViewManagerRecordList =
                                          snapshot.data;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewManagerRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewManagerRecord =
                                              listViewManagerRecordList[
                                                  listViewIndex];
                                          return InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ManagerDetailsWidget(
                                                    managerDetails:
                                                        listViewManagerRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Slidable(
                                              actionPane:
                                                  const SlidableScrollActionPane(),
                                              secondaryActions: [
                                                IconSlideAction(
                                                  caption: 'Share',
                                                  color: Colors.blue,
                                                  icon: Icons.share,
                                                  onTap: () {
                                                    print(
                                                        'SlidableActionWidget pressed ...');
                                                  },
                                                ),
                                              ],
                                              child: ListTile(
                                                title: Text(
                                                  listViewManagerRecord
                                                      .managerName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF303030),
                                                  size: 20,
                                                ),
                                                tileColor: Color(0xFFF5F5F5),
                                                dense: false,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
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
      ),
    );
  }
}
