import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagerDetailsWidget extends StatefulWidget {
  const ManagerDetailsWidget({
    Key key,
    this.managerDetails,
  }) : super(key: key);

  final ManagerRecord managerDetails;

  @override
  _ManagerDetailsWidgetState createState() => _ManagerDetailsWidgetState();
}

class _ManagerDetailsWidgetState extends State<ManagerDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ManagerRecord>(
      stream: ManagerRecord.getDocument(widget.managerDetails.reference),
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
        final managerDetailsManagerRecord = snapshot.data;
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
              'Manager Details',
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
                      managerDetailsManagerRecord.managerName,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Divider(),
                    Text(
                      'Email',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      managerDetailsManagerRecord.managerEmail,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Divider(),
                    Text(
                      'Role',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      'Manager',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'Associated Locations',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Expanded(
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<LocationsRecord> columnLocationsRecordList =
                                snapshot.data;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnLocationsRecordList.length,
                                    (columnIndex) {
                                  final columnLocationsRecord =
                                      columnLocationsRecordList[columnIndex];
                                  return Visibility(
                                    visible: widget.managerDetails.locationList
                                            .toList()
                                            ?.contains(columnLocationsRecord
                                                .address) ??
                                        true,
                                    child: ListTile(
                                      title: Text(
                                        columnLocationsRecord.address,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final userUpdateCreateData = createUserUpdateRecordData(
                          time: getCurrentTimestamp,
                          businessId: valueOrDefault(
                              currentUserDocument?.businessId, ''),
                          userMessage:
                              '${currentUserDisplayName} deleted  ${widget.managerDetails.managerName}',
                        );
                        await UserUpdateRecord.collection
                            .doc()
                            .set(userUpdateCreateData);
                        Navigator.pop(context);
                        await managerDetailsManagerRecord.reference.delete();
                      },
                      text: 'Delete Manager',
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
