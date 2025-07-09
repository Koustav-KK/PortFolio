import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkWeb extends StatefulWidget {
  const WorkWeb({super.key});

  @override
  State<WorkWeb> createState() => _WorkWebState();
}

class _WorkWebState extends State<WorkWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: DrawersWeb(),
        backgroundColor: Colors.white,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 500.0,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(size: 25.0, color: Colors.black),
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                      "assets/works.jpg",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    )),
                    title: TabsWebList()),
              ];
            },
            body: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30.0),
                    SansBold("WORKS", 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedCard(
                          imagePath: "assets/portfolio.png",
                          height: 200.0,
                          width: 400.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: widthDevice / 3,
                          child: Column(
                            children: [
                              SansBold("PortFolio", 30.0),
                              SizedBox(
                                height: 15.0,
                              ),
                              SansBold(
                                  "Deployed On Android, iOS and Web, The PortFolio Project Was Truly An Acheivement. I Used Flutter To Develop The Beautiful And Responsive UI And FireBase For The BackEnd",
                                  15.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedCard(
                          imagePath: "assets/budget.png",
                          height: 200.0,
                          width: 400.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                            width: widthDevice / 3,
                            child: Column(
                              children: [
                                SansBold("Budget App", 30.0),
                                SizedBox(
                                  height: 15.0,
                                ),
                                SansBold(
                                    "Deployed on Android, iOS, and Web, the Budget App lets users track income and expenses easily with a clean Flutter UI and secure Firebase backend",
                                    15.0),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
