import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerFeedbackWidget extends StatefulWidget {
  const CustomerFeedbackWidget({
    Key key,
    this.customerDetails,
  }) : super(key: key);

  final CustomerFeedbackRecord customerDetails;

  @override
  _CustomerFeedbackWidgetState createState() => _CustomerFeedbackWidgetState();
}

class _CustomerFeedbackWidgetState extends State<CustomerFeedbackWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Customer Feedback',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'San Francisco Pro',
                color: Colors.white,
                fontSize: 22,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Rating',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      '${widget.customerDetails.rating} Star',
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
                      'Client Name ',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      widget.customerDetails.name,
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
                      'Client Number ',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      widget.customerDetails.number,
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
                      'Employee Name',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      widget.customerDetails.employeeName,
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
                      'Location',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      widget.customerDetails.location,
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
                      'Comments',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      widget.customerDetails.comments,
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
                      dateTimeFormat('MMMMEEEEd', widget.customerDetails.time),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      dateTimeFormat('jm', widget.customerDetails.time),
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
            ],
          ),
        ),
      ),
    );
  }
}
