import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: DrawerMobile(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            //Introduction, first sec
            CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 113.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/crop.png",
                        filterQuality: FilterQuality.high)),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About Me", 35.0),
                  SizedBox(height: 10.0),
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
            SizedBox(
              height: 40.0,
            ),
            //2nd sec
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCard(
                  imagePath: "assets/app.png",
                  width: 200.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                SansBold("App Development", 20.0),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
            Sans(
                "I'm Here To Build Your Presence Online With State Of The Art Apps",
                15.0),
            //web dev, 3rd sec
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCard(
                  imagePath: "assets/webL.png",
                  width: 200.0,
                  reverse: true,
                ),
                SizedBox(
                  height: 30.0,
                ),
                SansBold("Web Development", 20.0),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
            //Backend Dev, 4rd sec
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCard(
                  imagePath: "assets/firebase.png",
                  width: 200.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                SansBold("Backend Development", 20.0),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
