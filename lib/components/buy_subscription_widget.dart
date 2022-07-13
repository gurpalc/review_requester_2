import '../buy_subscription_plan/buy_subscription_plan_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuySubscriptionWidget extends StatefulWidget {
  const BuySubscriptionWidget({Key key}) : super(key: key);

  @override
  _BuySubscriptionWidgetState createState() => _BuySubscriptionWidgetState();
}

class _BuySubscriptionWidgetState extends State<BuySubscriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You exceed your maximum requests',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title2,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                'Please buy a plan',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      width: 130,
                      height: 50,
                      color: Colors.black,
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
                      final isEntitled =
                          await revenue_cat.isEntitled('premium');
                      if (isEntitled == null) {
                        return;
                      } else if (!isEntitled) {
                        await revenue_cat.loadOfferings();
                      }

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuySubscriptionPlanWidget(),
                        ),
                      );
                    },
                    text: 'Buy',
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
          ],
        ),
      ),
    );
  }
}
