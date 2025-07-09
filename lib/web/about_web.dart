import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            size: 25.0,
            color: Colors.black,
          ),
          title: TabsWebList()),
      body: ListView(
        children: [
          // About Me Section
          SizedBox(
            height: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "About Me",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Hello I'm Koustav Karmakar I'm a B.Tech Computer Science And Engineering Student",
                          style: TextStyle(fontSize: 15),
                        ),
                        const Text(
                          "I Strive To Ensure Astounding Performance With State Of",
                          style: TextStyle(fontSize: 15),
                        ),
                        const Text(
                          "The Art Security Android, iOS, Web, MacOS and Windows",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            tealContainer("Flutter"),
                            const SizedBox(width: 7),
                            tealContainer("FireBase"),
                            const SizedBox(width: 7),
                            tealContainer("Android"),
                            const SizedBox(width: 7),
                            tealContainer("iOS"),
                            const SizedBox(width: 7),
                            tealContainer("MacOS"),
                            const SizedBox(width: 7),
                            tealContainer("Windows"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 147,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/crop.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // App Development Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "assets/app.png",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: const [
                    Text(
                      "App Development",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Web Development Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: const [
                    Text(
                      "Web Development",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: "assets/webL.png",
                height: 250.0,
                width: 250.0,
                reverse: true,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Backend Development Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "assets/firebase.png",
                height: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: const [
                    Text(
                      "BackEnd Development",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
