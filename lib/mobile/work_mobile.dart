import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkMobile extends StatefulWidget {
  const WorkMobile({super.key});

  @override
  State<WorkMobile> createState() => _WorkMobileState();
}

class _WorkMobileState extends State<WorkMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove extendBodyBehindAppBar or set to false
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      endDrawer: DrawerMobile(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxisScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 35.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/works.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                SansBold("WORKS", 35.0),
                SizedBox(height: 20.0),
                AnimatedCard(
                  imagePath: "assets/portfolio.png",
                  fit: BoxFit.contain,
                  height: 150.0,
                  width: 300.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                SansBold("PortFolio", 20.0),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Sans(
                      "Deployed On Android, iOS and Web, The PortFolio Project Was Truly An Acheivement. I Used Flutter To Develop The Beautiful And Responsive UI And FireBase For The BackEnd",
                      15.0),
                ),
                SizedBox(height: 20.0),
                AnimatedCard(
                  imagePath: "assets/budget.png",
                  fit: BoxFit.contain,
                  height: 150.0,
                  width: 300.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                SansBold("PortFolio", 20.0),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Sans(
                      "Deployed on Android, iOS, and Web, the Budget App lets users track income and expenses easily with a clean Flutter UI and secure Firebase backend",
                      15.0),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
