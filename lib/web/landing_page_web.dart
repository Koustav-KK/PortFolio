import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation1;
  late Animation<double> _fadeAnimation2;
  late Animation<double> _fadeAnimation3;
  late Animation<double> _fadeAnimation4;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 800), // Reduced duration for snappier feel
    )..forward();
    _fadeAnimation1 = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn));
    _fadeAnimation2 = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeIn));
    _fadeAnimation3 = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.8, curve: Curves.easeIn));
    _fadeAnimation4 = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final widthDevice = MediaQuery.of(context).size.width;
    final isWeb = widthDevice > 800;

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
              fontSize: isWeb ? 16 : 14,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.secondary,
            ),
            semanticsLabel: text,
          ),
        ),
      );
    }

    return Scaffold(
      drawer: const DrawersWeb(),
      backgroundColor: Colors.transparent,
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
                : 0), // Subtle parallax effect
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                size: 30,
                color: theme.colorScheme.onSurface,
              ),
              title: const TabsWebList(),
              pinned: false,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 60),
                  // First Section: Introduction
                  FadeTransition(
                    opacity: _fadeAnimation1,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      padding:
                          EdgeInsets.symmetric(horizontal: isWeb ? 40 : 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: theme.colorScheme.primary
                                            .withOpacity(0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: SansBold("Hello, I'm", isWeb ? 18 : 16,
                                      color: theme.colorScheme.onPrimary),
                                ),
                                const SizedBox(height: 16),
                                SansBold("Koustav Karmakar", isWeb ? 60 : 40),
                                Sans("B.Tech Student", isWeb ? 28 : 22),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Semantics(
                                      label: "Email",
                                      child: Icon(Icons.email,
                                          color: theme.colorScheme.primary,
                                          size: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    Semantics(
                                      label:
                                          "Email address: koustavscience29@gmail.com",
                                      child: Sans("koustavscience29@gmail.com",
                                          isWeb ? 16 : 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Semantics(
                                      label: "Phone",
                                      child: Icon(Icons.call,
                                          color: theme.colorScheme.primary,
                                          size: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    Semantics(
                                      label: "Phone number: 8617845174",
                                      child:
                                          Sans("8617845174", isWeb ? 16 : 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Semantics(
                                      label: "Location",
                                      child: Icon(Icons.location_pin,
                                          color: theme.colorScheme.primary,
                                          size: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    Semantics(
                                      label: "Location: Kolkata, India",
                                      child: Sans(
                                          "Kolkata, India", isWeb ? 16 : 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: CircleAvatar(
                                radius: isWeb ? 150 : 120,
                                backgroundColor: theme.colorScheme.primary,
                                child: CircleAvatar(
                                  radius: isWeb ? 146 : 116,
                                  backgroundColor: theme.colorScheme.surface,
                                  backgroundImage:
                                      const AssetImage("assets/crop.png"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  // Second Section: About Me
                  FadeTransition(
                    opacity: _fadeAnimation2,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      padding:
                          EdgeInsets.symmetric(horizontal: isWeb ? 40 : 20),
                      child: Wrap(
                        spacing: 40,
                        runSpacing: 40,
                        alignment: WrapAlignment.center,
                        children: [
                          SizedBox(
                            width:
                                isWeb ? widthDevice * 0.4 : widthDevice * 0.8,
                            child: Image.asset(
                              "assets/web.png",
                              height: isWeb
                                  ? widthDevice * 0.35
                                  : widthDevice * 0.5,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width:
                                isWeb ? widthDevice * 0.4 : widthDevice * 0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 250),
                                SansBold("About Me", isWeb ? 40 : 32),
                                const SizedBox(height: 16),
                                Sans(
                                  "Hello, I'm Koustav Karmakar, a B.Tech Computer Science and Engineering student passionate about building innovative applications.",
                                  isWeb ? 18 : 16,
                                ),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    skillChip("Flutter"),
                                    skillChip("Firebase"),
                                    skillChip("iOS"),
                                    skillChip("Android"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  // Third Section: What I Do
                  FadeTransition(
                    opacity: _fadeAnimation3,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      padding:
                          EdgeInsets.symmetric(horizontal: isWeb ? 40 : 20),
                      child: Column(
                        children: [
                          SansBold("What I Do?", isWeb ? 40 : 32),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: [
                              AnimatedCard(
                                imagePath: "assets/app.png",
                                text: "App Development",
                                width: isWeb ? 260 : 200,
                                height: isWeb ? 260 : 200,
                              ),
                              AnimatedCard(
                                imagePath: "assets/webL.png",
                                text: "Web Development",
                                fit: BoxFit.contain,
                                reverse: true,
                                width: isWeb ? 260 : 200,
                                height: isWeb ? 260 : 200,
                              ),
                              AnimatedCard(
                                imagePath: "assets/firebase.png",
                                text: "Back-end Development",
                                fit: BoxFit.contain,
                                width: isWeb ? 260 : 200,
                                height: isWeb ? 260 : 200,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  // Fourth Section: Contact Form
                  FadeTransition(
                    opacity: _fadeAnimation4,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      padding:
                          EdgeInsets.symmetric(horizontal: isWeb ? 40 : 20),
                      child: const ContactFormWeb(),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
