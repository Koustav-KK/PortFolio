import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:my_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawerMobile(),
        body: ListView(
          children: [
            CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 110.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/crop.png"),
              ),
            ),
            //Intro 1stSec
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            )),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: SansBold("Hello I'm", 15.0),
                      ),
                      SansBold("Koustav Karmakar", 40.0),
                      Sans("B.Tech Student", 20.0),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans("koustavscience29@gmail.com", 15.0),
                          Sans("8617845174", 15.0),
                          Sans("Kolkata,India", 15.0),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 90.0),
            //AboutMe 2ndSec

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About Me", 35.0),
                  Sans(
                      "Hello! I'm Koustav Karmakar I'm a B.Tech Computer Science And Engineering Student",
                      15.0),
                  Sans("Flutter Developer", 15.0),
                  Sans(
                      "Mastering App Development on Platforms: Android,iOS,MacOS,Windows",
                      15.0),
                  SizedBox(height: 10.0),
                  Wrap(
                    spacing: 7.0,
                    runSpacing: 7.0,
                    children: [
                      tealContainer("Flutter"),
                      tealContainer("FireBase"),
                      tealContainer("Android"),
                      tealContainer("iOS"),
                      tealContainer("MacOS"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 60.0),
            //3rdSec What I do

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold("What I Do?", 35.0),
                AnimatedCard(
                  imagePath: "assets/app.png",
                  text: "App Development",
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/webL.png",
                  text: "Web Development",
                  fit: BoxFit.contain,
                  width: 300.0,
                  reverse: true,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/firebase.png",
                  text: "Backend Development",
                  fit: BoxFit.contain,
                  width: 300.0,
                ),
                SizedBox(height: 60.0),
                //4thSec Contact
                ContactFormMobile(),
                SizedBox(height: 20.0)
              ],
            ),
          ],
        ));
  }
}
