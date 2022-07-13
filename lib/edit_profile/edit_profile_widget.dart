import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../splash_screen/splash_screen_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    Key key,
    this.managerDetails,
    this.employeeDetails,
  }) : super(key: key);

  final ManagerRecord managerDetails;
  final EmployeeRecord employeeDetails;

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: currentUserDisplayName);
    textController2 = TextEditingController(text: currentUserEmail);
  }

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
          buttonSize: 48,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'San Francisco Pro',
                color: FlutterFlowTheme.of(context).primaryBackground,
                fontWeight: FontWeight.w500,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                  child: Text(
                    'Update Account Information',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: AuthUserStreamWidget(
                    child: TextFormField(
                      controller: textController1,
                      onFieldSubmitted: (_) async {
                        if (formKey.currentState == null ||
                            !formKey.currentState.validate()) {
                          return;
                        }
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Your email...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'San Francisco Pro',
                                  color: Color(0x9AFFFFFF),
                                  useGoogleFonts: false,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person_rounded,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: TextFormField(
                    controller: textController2,
                    onFieldSubmitted: (_) async {
                      if (formKey.currentState == null ||
                          !formKey.currentState.validate()) {
                        return;
                      }
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Your email...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'San Francisco Pro',
                                color: Color(0x9AFFFFFF),
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ),
                ),
                if ((valueOrDefault(currentUserDocument?.userType, '')) !=
                    'Manager')
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                      child: AuthUserStreamWidget(
                        child: StreamBuilder<List<EmployeeRecord>>(
                          stream: queryEmployeeRecord(
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
                            List<EmployeeRecord> buttonEmployeeRecordList =
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final buttonEmployeeRecord =
                                buttonEmployeeRecordList.isNotEmpty
                                    ? buttonEmployeeRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                if (formKey.currentState == null ||
                                    !formKey.currentState.validate()) {
                                  return;
                                }

                                final usersUpdateData = createUsersRecordData(
                                  displayName: textController1.text,
                                  email: textController2.text,
                                );
                                await currentUserReference
                                    .update(usersUpdateData);

                                final employeeUpdateData =
                                    createEmployeeRecordData(
                                  employeeName: textController1.text,
                                  employeeEmail: textController2.text,
                                );
                                await buttonEmployeeRecord.reference
                                    .update(employeeUpdateData);
                                Navigator.pop(context);
                              },
                              text: 'Save Changes',
                              options: FFButtonOptions(
                                width: 230,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'San Francisco Pro',
                                      color: FlutterFlowTheme.of(context).white,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                if ((valueOrDefault(currentUserDocument?.userType, '')) ==
                    'Manager')
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                      child: AuthUserStreamWidget(
                        child: StreamBuilder<List<ManagerRecord>>(
                          stream: queryManagerRecord(
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
                            List<ManagerRecord> buttonManagerRecordList =
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final buttonManagerRecord =
                                buttonManagerRecordList.isNotEmpty
                                    ? buttonManagerRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                final usersUpdateData = createUsersRecordData(
                                  displayName: textController1.text,
                                  email: textController2.text,
                                );
                                await currentUserReference
                                    .update(usersUpdateData);

                                final managerUpdateData =
                                    createManagerRecordData(
                                  managerName: textController1.text,
                                  managerEmail: textController2.text,
                                );
                                await buttonManagerRecord.reference
                                    .update(managerUpdateData);
                                Navigator.pop(context);
                              },
                              text: 'Save Changes',
                              options: FFButtonOptions(
                                width: 230,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'San Francisco Pro',
                                      color: FlutterFlowTheme.of(context).white,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference.delete();
                        await deleteUser(context);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SplashScreenWidget(),
                          ),
                        );
                      },
                      text: 'Delete Account',
                      options: FFButtonOptions(
                        width: 230,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'San Francisco Pro',
                                  color: FlutterFlowTheme.of(context).white,
                                  useGoogleFonts: false,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
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
