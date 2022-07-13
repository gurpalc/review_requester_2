import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordScreenWidget extends StatefulWidget {
  const RecordScreenWidget({Key key}) : super(key: key);

  @override
  _RecordScreenWidgetState createState() => _RecordScreenWidgetState();
}

class _RecordScreenWidgetState extends State<RecordScreenWidget> {
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
          'Records',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: AuthUserStreamWidget(
                    child: StreamBuilder<List<UserUpdateRecord>>(
                      stream: queryUserUpdateRecord(
                        queryBuilder: (userUpdateRecord) => userUpdateRecord
                            .where('business_id',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.businessId, ''))
                            .orderBy('time', descending: true),
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
                        List<UserUpdateRecord> listViewUserUpdateRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewUserUpdateRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewUserUpdateRecord =
                                listViewUserUpdateRecordList[listViewIndex];
                            return ListTile(
                              title: Text(
                                listViewUserUpdateRecord.userMessage,
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              subtitle: Text(
                                dateTimeFormat(
                                    'yMMMd', listViewUserUpdateRecord.time),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            );
                          },
                        );
                      },
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
