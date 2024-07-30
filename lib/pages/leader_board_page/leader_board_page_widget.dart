import 'package:flutter/foundation.dart';
import 'package:json_path/fun_extra.dart';
import 'package:practica/controller/user_controller.dart';
import 'package:practica/models/ScoresModel.dart';
import 'package:practica/models/salasModel.dart';
import 'package:practica/pages/salas_page/salas_page_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'leader_board_page_model.dart';
export 'leader_board_page_model.dart';

class LeaderBoardPageWidget extends StatefulWidget {
  SalasModel? sala;

  LeaderBoardPageWidget({
    super.key,
    this.sala,
  });

  @override
  State<LeaderBoardPageWidget> createState() => _LeaderBoardPageWidgetState();
}

class _LeaderBoardPageWidgetState extends State<LeaderBoardPageWidget> {
  late LeaderBoardPageModel _model;
  bool isLoading = false;
  late ScoresModel scores;
  List<Widget> widgets = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    inicializar();
    super.initState();
    _model = createModel(context, () => LeaderBoardPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  inicializar() async {
    setState(() {
      isLoading = true;
    });
    scores = await UserController.getScores(widget.sala!.id);
    sortUsers();
    widgets = generateCarouselItems();
    print("scores ${scores}");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void sortUsers() {
    scores.participants.sort((a, b) {
      if (a.isWinner != b.isWinner) {
        return b.isWinner ? 1 : -1;
      } else {
        return b.balance.compareTo(a.balance);
      }
    });
  }

  List<Widget> generateCarouselItems() {
    return scores.participants.asMap().entries.map((entry) {
      int index = entry.key;
      return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: index == 0
            ? Color.fromARGB(255, 223, 208, 5)
            : index == 1
                ? Color.fromARGB(255, 166, 210, 240)
                : Color(0xFF873F31),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
                child: Image.network(
                  'https://i.pinimg.com/236x/9a/1d/cf/9a1dcf641f46d7f619ba14f55985e791.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              '${index + 1} Lugar',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 25,
                    letterSpacing: 0,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                entry.value.userName,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                'TOTAL',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: index == 0
                  ? Color.fromARGB(255, 189, 176, 5)
                  : index == 1
                      ? Color.fromARGB(255, 102, 181, 235)
                      : Color.fromARGB(255, 136, 60, 45),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  '\$ ${entry.value.balance}',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 30,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
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
            color: Color(0xFF1C2429),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Text(
                    'El Juego de la Bolsa\nGanadores',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 40,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                Lottie.asset(
                  'assets/lottie_animations/coins.json',
                  width: kIsWeb
                      ? MediaQuery.sizeOf(context).height * 0.20
                      : MediaQuery.sizeOf(context).width * 0.5,
                  height:
                      kIsWeb ? MediaQuery.sizeOf(context).height * 0.20 : 200,
                  fit: BoxFit.cover,
                  animate: true,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: kIsWeb
                        ? MediaQuery.sizeOf(context).width * 0.60
                        : MediaQuery.sizeOf(context).width,
                    height: kIsWeb
                        ? MediaQuery.sizeOf(context).height * 0.480
                        : 350,
                    child: CarouselSlider(
                      items: widgets,
                      carouselController: _model.carouselController ??=
                          CarouselController(),
                      options: CarouselOptions(
                        initialPage: 0,
                        viewportFraction: 0.7,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.25,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayInterval: Duration(milliseconds: (800 + 4000)),
                        autoPlayCurve: Curves.linear,
                        pauseAutoPlayInFiniteScroll: true,
                        onPageChanged: (index, _) =>
                            _model.carouselCurrentIndex = index,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SalaPagesWidget()),
                    );
                  },
                  text: 'Volver a jugar',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 0.0, 24.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
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
