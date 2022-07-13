import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_location_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../location_details/location_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationsWidget extends StatefulWidget {
  const LocationsWidget({Key key}) : super(key: key);

  @override
  _LocationsWidgetState createState() => _LocationsWidgetState();
}

class _LocationsWidgetState extends State<LocationsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Locations',
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
      floatingActionButton: Visibility(
        visible: (valueOrDefault(currentUserDocument?.userType, '')) == 'Owner',
        child: AuthUserStreamWidget(
          child: FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            elevation: 8,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                if ((valueOrDefault(currentUserDocument?.userType, '')) ==
                    'Owner') {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: AddLocationWidget(),
                      );
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'You are not a Owner',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: Color(0x00000000),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
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
                          List<LocationsRecord> listViewLocationsRecordList =
                              snapshot.data;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewLocationsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewLocationsRecord =
                                  listViewLocationsRecordList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LocationDetailsWidget(
                                          locationDetails:
                                              listViewLocationsRecord,
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
                                          if ((valueOrDefault(
                                                  currentUserDocument?.userType,
                                                  '')) ==
                                              'Owner') {
                                            await listViewLocationsRecord
                                                .reference
                                                .delete();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You are not Owner',
                                                  style: TextStyle(),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        listViewLocationsRecord.address,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'San Francisco Pro',
                                              color: Color(0xFF0B0404),
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor:
                                          FlutterFlowTheme.of(context).white,
                                      dense: false,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
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
