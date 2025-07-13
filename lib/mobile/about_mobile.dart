import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';
import 'package:flutter/foundation.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final ScrollController _scrollController = ScrollController();

  static const double kSpacingSmall = 20.0;
  static const double kSpacingMedium = 30.0;
  static const double kSpacingLarge = 40.0;

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

  Widget skillChip(String text, ThemeData theme) {
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

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: DrawerMobile(),
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
            transform: GradientRotation(
              _scrollController.hasClients
                  ? _scrollController.offset * 0.0005
                  : 0,
            ),
          ),
        ),
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(
                  size: 30,
                  color: theme.colorScheme.onSurface,
                ),
                floating: true,
                snap: true,
                elevation: 0,
              ),
            ];
          },
          body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 4, // About, App Dev, Web Dev, Backend Dev
            itemBuilder: (context, index) {
              switch (index) {
                case 0: // About Section
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: kSpacingSmall),
                        CircleAvatar(
                          radius: 117,
                          backgroundColor: theme.colorScheme.primary,
                          child: CircleAvatar(
                            radius: 113,
                            backgroundColor: theme.colorScheme.surface,
                            child: CircleAvatar(
                              radius: 110,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  const AssetImage("assets/crop.png"),
                            ),
                          ),
                        ),
                        SizedBox(height: kSpacingSmall),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SansBold("About Me", 35.toDouble()),
                              SizedBox(height: kSpacingSmall / 2),
                              Sans(
                                  "Hello! I'm Koustav Karmakar, a B.Tech Computer Science and Engineering Student",
                                  15.toDouble()),
                              Sans("Flutter Developer", 15.toDouble()),
                              Sans(
                                  "Mastering App Development on Platforms: Android, iOS and Web",
                                  15.toDouble()),
                              SizedBox(height: kSpacingSmall / 2),
                              Sans(
                                  "I'm here to build your presence online with state-of-the-art apps",
                                  15.toDouble()),
                              SizedBox(height: kSpacingSmall),
                              Wrap(
                                spacing: 7,
                                runSpacing: 7,
                                children: [
                                  skillChip("Flutter", theme),
                                  skillChip("FireBase", theme),
                                  skillChip("Android", theme),
                                  skillChip("iOS", theme),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                case 1: // App Development
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: kSpacingLarge),
                        AnimatedCard(
                          imagePath: "assets/app.png",
                          width: 300.toDouble(),
                          height: 200.toDouble(), // Added for consistency
                        ),
                        SizedBox(height: kSpacingMedium),
                        SansBold("App Development", 20.toDouble()),
                      ],
                    ),
                  );
                case 2: // Web Development
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: kSpacingLarge),
                        AnimatedCard(
                          imagePath: "assets/webL.png",
                          width: 300.toDouble(),
                          height: 200.toDouble(), // Added for consistency
                          reverse: true,
                        ),
                        SizedBox(height: kSpacingMedium),
                        SansBold("Web Development", 20.toDouble()),
                      ],
                    ),
                  );
                case 3: // Backend Development
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: kSpacingSmall),
                        AnimatedCard(
                          imagePath: "assets/firebase.png",
                          width: 300.toDouble(),
                          height: 200.toDouble(), // Added for consistency
                        ),
                        SizedBox(height: kSpacingMedium),
                        SansBold("Backend Development", 20.toDouble()),
                      ],
                    ),
                  );
                default:
                  return SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
