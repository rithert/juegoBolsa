import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'leader_board_page_model.dart';
export 'leader_board_page_model.dart';

class LeaderBoardPageWidget extends StatefulWidget {
  const LeaderBoardPageWidget({super.key});

  @override
  State<LeaderBoardPageWidget> createState() => _LeaderBoardPageWidgetState();
}

class _LeaderBoardPageWidgetState extends State<LeaderBoardPageWidget> {
  late LeaderBoardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderBoardPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF406E8E),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie_animations/wired-flat-1780-medal-first-place.json',
                    width: 200.0,
                    height: 230.0,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
