import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddManagersWidget extends StatefulWidget {
  const AddManagersWidget({Key key}) : super(key: key);

  @override
  _AddManagersWidgetState createState() => _AddManagersWidgetState();
}

class _AddManagersWidgetState extends State<AddManagersWidget> {
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  bool isSameMan;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x5D000000),
              offset: Offset(0, -2),
            )
          ],
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Add Manager',
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Fill out the details below to add a new manager.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'San Francisco Pro',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              useGoogleFonts: false,
                            ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                            labelText: 'Name',
                            hintText: 'Enter a description here...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'San Francisco Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      useGoogleFonts: false,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).darkBG,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).darkBG,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                            hintText: 'Enter a description here...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'San Francisco Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      useGoogleFonts: false,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).darkBG,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).darkBG,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }

                            if (!RegExp(kTextValidatorEmailRegex)
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 2, 0),
                  child: AuthUserStreamWidget(
                    child: StreamBuilder<List<LocationsRecord>>(
                      stream: queryLocationsRecord(
                        queryBuilder: (locationsRecord) =>
                            locationsRecord.where('business_id',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.businessId, '')),
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
                        List<LocationsRecord> dropDownLocationsRecordList =
                            snapshot.data;
                        return FlutterFlowDropDown(
                          options: dropDownLocationsRecordList
                              .map((e) => e.address)
                              .toList()
                              .toList(),
                          onChanged: (val) =>
                              setState(() => dropDownValue = val),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'San Francisco Pro',
                                    color: Colors.black,
                                    useGoogleFonts: false,
                                  ),
                          hintText: 'Please select  address...',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.black,
                          borderWidth: 0,
                          borderRadius: 10,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryBlack,
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
                      FFButtonWidget(
                        onPressed: () async {
                          if (formKey.currentState == null ||
                              !formKey.currentState.validate()) {
                            return;
                          }

                          isSameMan = await actions.sameManager(
                            textController2.text,
                          );
                          if ((isSameMan) == true) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'The email you entered is already allocated to another company.',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0x00000000),
                              ),
                            );
                          } else {
                            final managerCreateData = {
                              ...createManagerRecordData(
                                managerName: textController1.text,
                                managerEmail: textController2.text,
                                ownerId: currentUserUid,
                                businessId: valueOrDefault(
                                    currentUserDocument?.businessId, ''),
                                businessName: valueOrDefault(
                                    currentUserDocument?.businessName, ''),
                              ),
                              'location_list': [dropDownValue],
                            };
                            await ManagerRecord.collection
                                .doc()
                                .set(managerCreateData);

                            final userUpdateCreateData =
                                createUserUpdateRecordData(
                              time: getCurrentTimestamp,
                              businessId: valueOrDefault(
                                  currentUserDocument?.businessId, ''),
                              userMessage:
                                  '${currentUserDisplayName} added ${textController1.text}',
                            );
                            await UserUpdateRecord.collection
                                .doc()
                                .set(userUpdateCreateData);
                            Navigator.pop(context);
                          }

                          setState(() {});
                        },
                        text: 'Add',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'San Francisco Pro',
                                    color: Colors.white,
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
                    ],
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
