import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryDetailsWidget extends StatefulWidget {
  const HistoryDetailsWidget({
    Key key,
    this.historyDetails,
  }) : super(key: key);

  final SendRequestsRecord historyDetails;

  @override
  _HistoryDetailsWidgetState createState() => _HistoryDetailsWidgetState();
}

class _HistoryDetailsWidgetState extends State<HistoryDetailsWidget> {
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
          'History Details',
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
                  'Client Name',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  widget.historyDetails.clientName,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
                if ((widget.historyDetails.clientNumber != null &&
                    widget.historyDetails.clientNumber != ''))
                  Text(
                    'Client Number ',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                if ((widget.historyDetails.clientNumber != null &&
                    widget.historyDetails.clientNumber != ''))
                  Text(
                    widget.historyDetails.clientNumber,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                if ((widget.historyDetails.clientNumber != null &&
                    widget.historyDetails.clientNumber != ''))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Container(
                      width: double.infinity,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                if ((widget.historyDetails.clientEmail != null &&
                    widget.historyDetails.clientEmail != ''))
                  Text(
                    'Client Email ',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                if ((widget.historyDetails.clientEmail != null &&
                    widget.historyDetails.clientEmail != ''))
                  Text(
                    widget.historyDetails.clientEmail,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                if ((widget.historyDetails.clientEmail != null &&
                    widget.historyDetails.clientEmail != ''))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Container(
                      width: double.infinity,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                Text(
                  'Message',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  widget.historyDetails.message,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
                Text(
                  'Send By',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  widget.historyDetails.senderName,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
                Text(
                  'Send Time',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  dateTimeFormat('MMMMEEEEd', widget.historyDetails.sendTime),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  dateTimeFormat('jm', widget.historyDetails.sendTime),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
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
