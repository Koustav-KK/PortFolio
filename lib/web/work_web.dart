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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.0),
                    SansBold("WORKS", 40.0),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: AnimatedCard(
                            imagePath: "assets/portfolio.png",
                            height: 200.0,
                            width: 400.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: widthDevice / 3,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SansBold("PortFolio", 30.0),
                                SizedBox(height: 15.0),
                                SansBold(
                                    "Deployed On Android, iOS and Web, The PortFolio Project Was Truly An Acheivement. I Used Flutter To Develop The Beautiful And Responsive UI And FireBase For The BackEnd",
                                    15.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: AnimatedCard(
                            imagePath: "assets/budget.png",
                            height: 200.0,
                            width: 400.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                            width: widthDevice / 3,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SansBold("Budget App", 30.0),
                                  SizedBox(height: 15.0),
                                  SansBold(
                                      "Deployed on Android, iOS, and Web, the Budget App lets users track income and expenses easily with a clean Flutter UI and secure Firebase backend",
                                      15.0),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 80.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Transform.translate(
                          offset: const Offset(50.0,
                              0.0), // Adjust this value: negative to move left, positive to move right
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: AnimatedCard(
                              imagePath: "assets/weather.png",
                              height: 200.0,
                              width: 100.0, // Kept slim as requested
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: widthDevice / 3,
                            child: Transform.translate(
                              offset: const Offset(100.2,
                                  0.0), // Adjust horizontal position to match "Budget App" text
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SansBold("Weather App", 30.0),
                                    SizedBox(height: 15.0),
                                    SansBold(
                                        "Deployed on Android, iOS, the Weather App provides real-time updates with a sleek Flutter UI.",
                                        15.0),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 80.0),
                  ],
                ),
              ],
            )));
  }
}
