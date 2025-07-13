import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    Widget skillChip(String text) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.secondary, width: 2),
            borderRadius: BorderRadius.circular(10),
            color: theme.colorScheme.secondary.withOpacity(0.15),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.secondary.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: kIsWeb ? 16 : 14,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.secondary,
            ),
            semanticsLabel: text,
          ),
        ),
      );
    }

    return Scaffold(
      drawer: DrawersWeb(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.primary.withOpacity(0.2),
              theme.colorScheme.secondary.withOpacity(0.2),
              theme.colorScheme.surface.withOpacity(0.9),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
            transform: GradientRotation(_scrollController.hasClients
                ? _scrollController.offset * 0.0005
                : 0),
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                size: 25.0,
                color: theme.colorScheme.onSurface,
              ),
              title: const TabsWebList(),
              floating:
                  true, // disappear on scroll down, appear on scroll up// snap immediately on scroll up
              pinned: false, // not pinned
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SizedBox(
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
                                SansBold("About Me", 40.0),
                                const SizedBox(height: 15),
                                Sans(
                                  "Hello I'm Koustav Karmakar I'm a B.Tech Computer Science And Engineering Student",
                                  15.0,
                                ),
                                Sans(
                                  "I Strive To Ensure Astounding Performance With State Of",
                                  15.0,
                                ),
                                Sans(
                                  "The Art Security Android, iOS and Web",
                                  15.0,
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 7.0,
                                  runSpacing: 7.0,
                                  children: [
                                    skillChip("Flutter"),
                                    skillChip("FireBase"),
                                    skillChip("Android"),
                                    skillChip("iOS"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 147,
                          backgroundColor: theme.colorScheme.primary,
                          child: CircleAvatar(
                            radius: 143,
                            backgroundColor: theme.colorScheme.surface,
                            child: CircleAvatar(
                              radius: 140,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  const AssetImage("assets/crop.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SansBold("App Development", 30.0),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: widthDevice / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SansBold("Web Development", 30.0),
                            const SizedBox(height: 15),
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
                ),
                const SizedBox(height: 20),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedCard(
                        imagePath: "assets/firebase.png",
                        height: 250.0,
                        width: 250.0,
                      ),
                      SizedBox(
                        width: widthDevice / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SansBold("BackEnd Development", 30.0),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
