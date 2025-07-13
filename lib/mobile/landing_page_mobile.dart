import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final ScrollController _scrollController = ScrollController();

  static const double kSpacingSmall = 20.0;
  static const double kSpacingMedium = 35.0;
  static const double kSpacingLarge = 60.0;
  static const double kSectionGap = 90.0;

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
    if (!mounted) return const SizedBox.shrink(); // Prevent build if disposed

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
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
          ],
          body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 5, // Profile, Gap, About, What I Do, Contact
            itemBuilder: (context, index) {
              if (!mounted) return const SizedBox.shrink(); // Safety check

              switch (index) {
                case 0: // Profile Section
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        SizedBox(height: kSpacingSmall),
                        CircleAvatar(
                          radius: 117.0,
                          backgroundColor: theme.colorScheme.primary,
                          child: CircleAvatar(
                            radius: 113.0,
                            backgroundColor: theme.colorScheme.surface,
                            child: CircleAvatar(
                              radius: 110.0,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                "assets/crop.png",
                                filterQuality: FilterQuality.high,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: kSpacingSmall),
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.colorScheme.primary
                                          .withOpacity(0.3),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: SansBold(
                                  "Hello I'm",
                                  15.toDouble(),
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                              SansBold("Koustav Karmakar", 40.toDouble()),
                              Sans("B.Tech Student", 20.toDouble()),
                              SizedBox(height: kSpacingSmall),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.email,
                                          color: theme.colorScheme.primary),
                                      Icon(Icons.call,
                                          color: theme.colorScheme.primary),
                                      Icon(Icons.location_pin,
                                          color: theme.colorScheme.primary),
                                    ],
                                  ),
                                  SizedBox(width: kSpacingSmall),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Sans("koustavscience29@gmail.com",
                                          15.toDouble()),
                                      Sans("8617845174", 15.toDouble()),
                                      Sans("Kolkata, India", 15.toDouble()),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                case 1: // Gap before About Section
                  return SizedBox(height: kSectionGap);
                case 2: // About Section
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SansBold("About Me", 35.toDouble()),
                          Sans(
                            "Hello! I'm Koustav Karmakar I'm a B.Tech Computer Science And Engineering Student",
                            15.toDouble(),
                          ),
                          Sans("Flutter Developer", 15.toDouble()),
                          Sans(
                            "Mastering App Development on Platforms: Android, iOS and Web",
                            15.toDouble(),
                          ),
                          SizedBox(height: kSpacingSmall),
                          Wrap(
                            spacing: 7,
                            runSpacing: 7,
                            children: [
                              skillChip("Flutter", theme),
                              skillChip("Firebase", theme),
                              skillChip("Android", theme),
                              skillChip("iOS", theme),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                case 3: // What I Do Section
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: kSpacingLarge),
                        SansBold("What I Do?", 35.toDouble()),
                        AnimatedCard(
                          imagePath: "assets/app.png",
                          width: 300.toDouble(), // Fixed to double
                        ),
                        SizedBox(height: kSpacingMedium),
                        SansBold("App Development", 20.toDouble()),
                        AnimatedCard(
                          imagePath: "assets/webL.png",
                          width: 300.toDouble(), // Fixed to double
                        ),
                        SizedBox(height: kSpacingMedium),
                        SansBold("Web Development", 20.toDouble()),
                        AnimatedCard(
                          imagePath: "assets/firebase.png",
                          width: 300.toDouble(), // Fixed to double
                        ),
                        SizedBox(height: kSpacingMedium),
                        SansBold("Backend Development", 20.toDouble()),
                      ],
                    ),
                  );
                case 4: // Contact Section
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        SizedBox(height: kSpacingLarge),
                        ContactFormMobile(),
                        SizedBox(height: kSpacingSmall),
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
