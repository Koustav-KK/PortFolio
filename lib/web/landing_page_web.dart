import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:my_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    Widget skillChip(String text) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.tealAccent,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(7.0),
        child: Sans(text, 20.0),
      );
    }

    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            size: 25.0,
            color: Colors.black,
          ),
          title: TabsWebList()),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
          ),
          // Firstpage
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(height: 15.0),
                      SansBold("Koustav Karmakar", 55.0),
                      Sans("B.Tech Student", 30.0),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 20.0),
                          Sans("koustavscience29@gmail.com", 15.0),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Icon(Icons.call),
                          SizedBox(width: 20.0),
                          Sans("8617845174", 15.0),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          SizedBox(width: 20.0),
                          Sans("Kolkata,India", 15.0),
                        ],
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                Flexible(
                  child: CircleAvatar(
                    radius: 147.0,
                    backgroundColor: Colors.tealAccent,
                    child: CircleAvatar(
                      radius: 143.0,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 140.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/crop.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 90),

          // Secondpage
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                SizedBox(
                  width: widthDevice * 2,
                  child: Image.asset(
                    "assets/web.png",
                    height: widthDevice * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 20.0),
                SizedBox(
                  width: widthDevice / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SansBold("About Me", 40.0),
                      SizedBox(height: 15.0),
                      Sans(
                        "Hello I'm Koustav Karmakar I'm a B.Tech Computer Science And Engineering Student",
                        20.0,
                      ),
                      SizedBox(height: 10.0),
                      Wrap(
                        spacing: 7.0,
                        runSpacing: 7.0,
                        children: [
                          skillChip("Flutter"),
                          skillChip("Firebase"),
                          skillChip("iOS"),
                          skillChip("Android"),
                          skillChip("Windows"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Thirdpage
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SansBold("What I Do?", 40.0),
                SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: "App Development",
                    ),
                    AnimatedCard(
                      imagePath: "assets/webL.png",
                      text: "Web Development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      text: "Back-end Development",
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Fourthpage (Contact Form)
          SizedBox(height: 15.0),
          ContactFormWeb(),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
