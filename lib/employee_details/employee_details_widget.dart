import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeDetailsWidget extends StatefulWidget {
  const EmployeeDetailsWidget({
    Key key,
    this.employeeDetails,
  }) : super(key: key);

  final EmployeeRecord employeeDetails;

  @override
  _EmployeeDetailsWidgetState createState() => _EmployeeDetailsWidgetState();
}

class _EmployeeDetailsWidgetState extends State<EmployeeDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EmployeeRecord>(
      stream: EmployeeRecord.getDocument(widget.employeeDetails.reference),
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
        final employeeDetailsEmployeeRecord = snapshot.data;
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
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Employee Details',
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
                  children: [
                    Text(
                      'Name',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      employeeDetailsEmployeeRecord.employeeName,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Divider(),
                    Text(
                      'Email',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      employeeDetailsEmployeeRecord.employeeEmail,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Divider(),
                    Text(
                      'Role',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Expanded(
                      child: Text(
                        'Employee',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final userUpdateCreateData = createUserUpdateRecordData(
                          time: getCurrentTimestamp,
                          businessId: valueOrDefault(
                              currentUserDocument?.businessId, ''),
                          userMessage:
                              '${currentUserDisplayName} deleted  ${widget.employeeDetails.employeeName}',
                        );
                        await UserUpdateRecord.collection
                            .doc()
                            .set(userUpdateCreateData);
                        Navigator.pop(context);
                        await employeeDetailsEmployeeRecord.reference.delete();
                      },
                      text: 'Delete Employee',
                      options: FFButtonOptions(
                        width: 160,
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
