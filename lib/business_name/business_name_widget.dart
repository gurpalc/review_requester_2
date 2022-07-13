import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessNameWidget extends StatefulWidget {
  const BusinessNameWidget({Key key}) : super(key: key);

  @override
  _BusinessNameWidgetState createState() => _BusinessNameWidgetState();
}

class _BusinessNameWidgetState extends State<BusinessNameWidget> {
  TextEditingController businessAddressController;
  TextEditingController businessNamController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    businessAddressController = TextEditingController();
    businessNamController = TextEditingController();
  }

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
                  child: Text(
                    'What is the name of your business?',
                    style: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'San Francisco Pro',
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: TextFormField(
                          controller: businessNamController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'businessNamController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          onFieldSubmitted: (_) async {
                            if (formKey.currentState == null ||
                                !formKey.currentState.validate()) {
                              return;
                            }
                          },
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter business name here...',
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
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }
                            if (val.length < 4) {
                              return 'Requires at least 4 characters.';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'What is your business address? (This could be a city or your exact address)',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'San Francisco Pro',
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: TextFormField(
                          controller: businessAddressController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'businessAddressController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          onFieldSubmitted: (_) async {
                            if (formKey.currentState == null ||
                                !formKey.currentState.validate()) {
                              return;
                            }
                          },
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter business address here...',
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
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<LocationsRecord>>(
                        stream: queryLocationsRecord(
                          queryBuilder: (locationsRecord) =>
                              locationsRecord.where('business_id',
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
                          List<LocationsRecord> buttonLocationsRecordList =
                              snapshot.data;
                          final buttonLocationsRecord =
                              buttonLocationsRecordList.isNotEmpty
                                  ? buttonLocationsRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              if (formKey.currentState == null ||
                                  !formKey.currentState.validate()) {
                                return;
                              }

                              final usersUpdateData = createUsersRecordData(
                                businessName: businessNamController.text,
                                businessId: random_data.randomString(
                                  20,
                                  20,
                                  true,
                                  true,
                                  true,
                                ),
                                numberRequests: 3,
                                solicited: true,
                              );
                              await currentUserReference
                                  .update(usersUpdateData);

                              final locationsCreateData =
                                  createLocationsRecordData(
                                address: businessAddressController.text,
                                ownerId: currentUserUid,
                                locationId: random_data.randomString(
                                  20,
                                  20,
                                  true,
                                  true,
                                  true,
                                ),
                                businessId: valueOrDefault(
                                    currentUserDocument?.businessId, ''),
                              );
                              await LocationsRecord.collection
                                  .doc()
                                  .set(locationsCreateData);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'Locations'),
                                ),
                              );
                            },
                            text: 'Next',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'To get started after you press \"Next\", go to the locations tab and click your location. Add in at least one link to a review website. \n\nFor further instructions on getting started, please view the FAQs page in the settings. If you have questions on getting started, don\'t hesitate at all to contact us at support@reviewrequester.io or text 1-360-525-3401. Thank you!',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'San Francisco Pro',
                                      fontStyle: FontStyle.italic,
                                      useGoogleFonts: false,
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
        ),
      ),
    );
  }
}
