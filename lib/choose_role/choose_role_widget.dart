import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../business_name/business_name_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../register/register_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRoleWidget extends StatefulWidget {
  const ChooseRoleWidget({Key key}) : super(key: key);

  @override
  _ChooseRoleWidgetState createState() => _ChooseRoleWidgetState();
}

class _ChooseRoleWidgetState extends State<ChooseRoleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choose Your Role In The Business',
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'San Francisco Pro',
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StreamBuilder<List<EmployeeRecord>>(
                      stream: queryEmployeeRecord(
                        queryBuilder: (employeeRecord) => employeeRecord.where(
                            'employee_email',
                            isEqualTo: currentUserEmail),
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
                        List<EmployeeRecord> buttonEmployeeRecordList =
                            snapshot.data;
                        final buttonEmployeeRecord =
                            buttonEmployeeRecordList.isNotEmpty
                                ? buttonEmployeeRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            if (buttonEmployeeRecord != null) {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Confirm Choice'),
                                            content: Text(
                                                'You chose your role as employee. Do you confirm this as true?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                final usersUpdateData = createUsersRecordData(
                                  userType: 'Employee',
                                  businessId: buttonEmployeeRecord.businessId,
                                  businessName:
                                      buttonEmployeeRecord.businessName,
                                );
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'SendSMS'),
                                  ),
                                );
                              } else {
                                Navigator.pop(context);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Sorry, your email is not in our system. Your supervisor may have spelt it incorrectly when registering. Please inform them of this. Thank you',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 60000),
                                  backgroundColor: Colors.black,
                                ),
                              );
                              await currentUserReference.delete();
                              await deleteUser(context);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterWidget(),
                                ),
                              );
                            }
                          },
                          text: 'Employee',
                          options: FFButtonOptions(
                            width: 100,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      },
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Confirm Choice'),
                                  content: Text(
                                      'You chose your role as owner. Do you confirm this as true?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          final usersUpdateData = createUsersRecordData(
                            userType: 'Owner',
                          );
                          await currentUserReference.update(usersUpdateData);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BusinessNameWidget(),
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      text: 'Owner',
                      options: FFButtonOptions(
                        width: 100,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'San Francisco Pro',
                                  color: Colors.white,
                                  useGoogleFonts: false,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    StreamBuilder<List<ManagerRecord>>(
                      stream: queryManagerRecord(
                        queryBuilder: (managerRecord) => managerRecord.where(
                            'manager_email',
                            isEqualTo: currentUserEmail),
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
                        List<ManagerRecord> buttonManagerRecordList =
                            snapshot.data;
                        final buttonManagerRecord =
                            buttonManagerRecordList.isNotEmpty
                                ? buttonManagerRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            if (buttonManagerRecord != null) {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Confirm Choice'),
                                            content: Text(
                                                'You chose your role as Manager. Do you confirm this as true?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                final usersUpdateData = createUsersRecordData(
                                  userType: 'Manager',
                                  businessId: buttonManagerRecord.businessId,
                                  businessName:
                                      buttonManagerRecord.businessName,
                                );
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'Locations'),
                                  ),
                                );
                              } else {
                                Navigator.pop(context);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Sorry, your email is not in our system. Your supervisor may have spelt it incorrectly when registering. Please inform them of this. Thank you',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 60000),
                                  backgroundColor: Colors.black,
                                ),
                              );
                              await currentUserReference.delete();
                              await deleteUser(context);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterWidget(),
                                ),
                              );
                            }
                          },
                          text: 'Manager',
                          options: FFButtonOptions(
                            width: 100,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
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
    );
  }
}
