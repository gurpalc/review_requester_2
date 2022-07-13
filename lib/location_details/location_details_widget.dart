import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationDetailsWidget extends StatefulWidget {
  const LocationDetailsWidget({
    Key key,
    this.locationDetails,
  }) : super(key: key);

  final LocationsRecord locationDetails;

  @override
  _LocationDetailsWidgetState createState() => _LocationDetailsWidgetState();
}

class _LocationDetailsWidgetState extends State<LocationDetailsWidget> {
  TextEditingController facebookController;
  TextEditingController googleController;
  TextEditingController yelpController;
  TextEditingController otherController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    facebookController =
        TextEditingController(text: widget.locationDetails.fbReviewsite);
    googleController =
        TextEditingController(text: widget.locationDetails.googleReviewsite);
    yelpController =
        TextEditingController(text: widget.locationDetails.yelpReviewsite);
    otherController =
        TextEditingController(text: widget.locationDetails.otherReviewsite);
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
          widget.locationDetails.address,
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
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if ((valueOrDefault(currentUserDocument?.userType, '')) ==
                      'Owner')
                    AuthUserStreamWidget(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.google,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Google Maps Review Link',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'San Francisco Pro',
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StreamBuilder<List<BusinessReviewRecord>>(
                              stream: queryBusinessReviewRecord(
                                queryBuilder: (businessReviewRecord) =>
                                    businessReviewRecord
                                        .where('location_id',
                                            isEqualTo:
                                                widget.locationDetails.address)
                                        .where('site_type',
                                            isEqualTo: 'google'),
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
                                List<BusinessReviewRecord>
                                    rowBusinessReviewRecordList = snapshot.data;
                                final rowBusinessReviewRecord =
                                    rowBusinessReviewRecordList.isNotEmpty
                                        ? rowBusinessReviewRecordList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 0, 0),
                                        child: TextFormField(
                                          controller: googleController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'googleController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText:
                                                'Paste link to your Google review page',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 10, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final locationsUpdateData =
                                              createLocationsRecordData(
                                            googleReviewsite:
                                                googleController.text,
                                          );
                                          await widget.locationDetails.reference
                                              .update(locationsUpdateData);
                                          if (rowBusinessReviewRecord != null) {
                                            final businessReviewUpdateData =
                                                createBusinessReviewRecordData(
                                              siteUrl: googleController.text,
                                            );
                                            await rowBusinessReviewRecord
                                                .reference
                                                .update(
                                                    businessReviewUpdateData);
                                          } else {
                                            final businessReviewCreateData =
                                                createBusinessReviewRecordData(
                                              locationId: widget
                                                  .locationDetails.address,
                                              siteType: 'google',
                                              siteUrl: googleController.text,
                                              businessId: valueOrDefault(
                                                  currentUserDocument
                                                      ?.businessId,
                                                  ''),
                                            );
                                            await BusinessReviewRecord
                                                .collection
                                                .doc()
                                                .set(businessReviewCreateData);
                                          }

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your google review link is saved',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 15000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0x83000000),
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 40,
                                          height: 42,
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily:
                                                        'San Francisco Pro',
                                                    color: Colors.white,
                                                    useGoogleFonts: false,
                                                  ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBlack,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                              child: InkWell(
                                onTap: () async {
                                  await launchURL(
                                      'https://www.reviewrequester.io/how-to-get-google-review-link');
                                },
                                child: Text(
                                  'Click here for instructions to find your link',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'San Francisco Pro',
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Color(0xFF282727),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Facebook Review Link',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'San Francisco Pro',
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: TextFormField(
                                      controller: facebookController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'facebookController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText:
                                            'Paste link to your Facebook review page',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 10, 0, 0),
                                  child:
                                      StreamBuilder<List<BusinessReviewRecord>>(
                                    stream: queryBusinessReviewRecord(
                                      queryBuilder: (businessReviewRecord) =>
                                          businessReviewRecord
                                              .where('location_id',
                                                  isEqualTo: widget
                                                      .locationDetails.address)
                                              .where('site_type',
                                                  isEqualTo: 'facebook'),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<BusinessReviewRecord>
                                          buttonBusinessReviewRecordList =
                                          snapshot.data;
                                      final buttonBusinessReviewRecord =
                                          buttonBusinessReviewRecordList
                                                  .isNotEmpty
                                              ? buttonBusinessReviewRecordList
                                                  .first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          final locationsUpdateData =
                                              createLocationsRecordData(
                                            fbReviewsite:
                                                facebookController.text,
                                          );
                                          await widget.locationDetails.reference
                                              .update(locationsUpdateData);
                                          if (buttonBusinessReviewRecord !=
                                              null) {
                                            final businessReviewUpdateData =
                                                createBusinessReviewRecordData(
                                              siteUrl: facebookController.text,
                                            );
                                            await buttonBusinessReviewRecord
                                                .reference
                                                .update(
                                                    businessReviewUpdateData);
                                          } else {
                                            final businessReviewCreateData =
                                                createBusinessReviewRecordData(
                                              locationId: widget
                                                  .locationDetails.address,
                                              siteType: 'facebook',
                                              siteUrl: facebookController.text,
                                              businessId: valueOrDefault(
                                                  currentUserDocument
                                                      ?.businessId,
                                                  ''),
                                            );
                                            await BusinessReviewRecord
                                                .collection
                                                .doc()
                                                .set(businessReviewCreateData);
                                          }

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your facebook review link is saved',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 15000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0x83000000),
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 40,
                                          height: 42,
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily:
                                                        'San Francisco Pro',
                                                    color: Colors.white,
                                                    useGoogleFonts: false,
                                                  ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBlack,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                              child: InkWell(
                                onTap: () async {
                                  await launchURL(
                                      'https://www.reviewrequester.io/how-to-get-facebook-review-link');
                                },
                                child: Text(
                                  'Click here for instructions to find your link',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'San Francisco Pro',
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Color(0xFF282727),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.yelp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Yelp Review Link',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'San Francisco Pro',
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: TextFormField(
                                      controller: yelpController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'yelpController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText:
                                            'Paste link to your Yelp review page',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 10, 0, 0),
                                  child:
                                      StreamBuilder<List<BusinessReviewRecord>>(
                                    stream: queryBusinessReviewRecord(
                                      queryBuilder: (businessReviewRecord) =>
                                          businessReviewRecord
                                              .where('location_id',
                                                  isEqualTo: widget
                                                      .locationDetails.address)
                                              .where('site_type',
                                                  isEqualTo: 'yelp'),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<BusinessReviewRecord>
                                          buttonBusinessReviewRecordList =
                                          snapshot.data;
                                      final buttonBusinessReviewRecord =
                                          buttonBusinessReviewRecordList
                                                  .isNotEmpty
                                              ? buttonBusinessReviewRecordList
                                                  .first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          final locationsUpdateData =
                                              createLocationsRecordData(
                                            yelpReviewsite: yelpController.text,
                                          );
                                          await widget.locationDetails.reference
                                              .update(locationsUpdateData);
                                          if (buttonBusinessReviewRecord !=
                                              null) {
                                            final businessReviewUpdateData =
                                                createBusinessReviewRecordData(
                                              siteUrl: yelpController.text,
                                            );
                                            await buttonBusinessReviewRecord
                                                .reference
                                                .update(
                                                    businessReviewUpdateData);
                                          } else {
                                            final businessReviewCreateData =
                                                createBusinessReviewRecordData(
                                              locationId: widget
                                                  .locationDetails.address,
                                              siteType: 'yelp',
                                              siteUrl: yelpController.text,
                                              businessId: valueOrDefault(
                                                  currentUserDocument
                                                      ?.businessId,
                                                  ''),
                                            );
                                            await BusinessReviewRecord
                                                .collection
                                                .doc()
                                                .set(businessReviewCreateData);
                                          }

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your yelp review link is saved',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 15000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0x83000000),
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 40,
                                          height: 42,
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily:
                                                        'San Francisco Pro',
                                                    color: Colors.white,
                                                    useGoogleFonts: false,
                                                  ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBlack,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                              child: InkWell(
                                onTap: () async {
                                  await launchURL(
                                      'https://www.reviewrequester.io/how-to-get-yelp-review-link');
                                },
                                child: Text(
                                  'Click here for instructions to find your link',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'San Francisco Pro',
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Color(0xFF282727),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.link,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Other Review Link',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'San Francisco Pro',
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 10),
                                    child: TextFormField(
                                      controller: otherController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'otherController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText:
                                            'Paste link to custom review page',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child:
                                      StreamBuilder<List<BusinessReviewRecord>>(
                                    stream: queryBusinessReviewRecord(
                                      queryBuilder: (businessReviewRecord) =>
                                          businessReviewRecord
                                              .where('location_id',
                                                  isEqualTo: widget
                                                      .locationDetails.address)
                                              .where('site_type',
                                                  isEqualTo: 'other'),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<BusinessReviewRecord>
                                          buttonBusinessReviewRecordList =
                                          snapshot.data;
                                      final buttonBusinessReviewRecord =
                                          buttonBusinessReviewRecordList
                                                  .isNotEmpty
                                              ? buttonBusinessReviewRecordList
                                                  .first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          final locationsUpdateData =
                                              createLocationsRecordData(
                                            otherReviewsite:
                                                otherController.text,
                                          );
                                          await widget.locationDetails.reference
                                              .update(locationsUpdateData);
                                          if (buttonBusinessReviewRecord !=
                                              null) {
                                            final businessReviewUpdateData =
                                                createBusinessReviewRecordData(
                                              siteUrl: otherController.text,
                                            );
                                            await buttonBusinessReviewRecord
                                                .reference
                                                .update(
                                                    businessReviewUpdateData);
                                          } else {
                                            final businessReviewCreateData =
                                                createBusinessReviewRecordData(
                                              locationId: widget
                                                  .locationDetails.address,
                                              siteType: 'other',
                                              siteUrl: otherController.text,
                                              businessId: valueOrDefault(
                                                  currentUserDocument
                                                      ?.businessId,
                                                  ''),
                                            );
                                            await BusinessReviewRecord
                                                .collection
                                                .doc()
                                                .set(businessReviewCreateData);
                                          }

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your google review link is saved',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 15000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0x83000000),
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 40,
                                          height: 42,
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily:
                                                        'San Francisco Pro',
                                                    color: Colors.white,
                                                    useGoogleFonts: false,
                                                  ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBlack,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Color(0xFF282727),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if ((valueOrDefault(currentUserDocument?.userType, '')) !=
                      'Owner')
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: AuthUserStreamWidget(
                        child: Text(
                          'Only owner can see this page',
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
      ),
    );
  }
}
