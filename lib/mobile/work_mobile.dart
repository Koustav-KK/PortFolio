import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';

class WorkMobile extends StatefulWidget {
  const WorkMobile({super.key});

  @override
  State<WorkMobile> createState() => _WorkMobileState();
}

class _WorkMobileState extends State<WorkMobile>
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
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.transparent,
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
            transform: GradientRotation(_scrollController.hasClients
                ? _scrollController.offset * 0.0005
                : 0), // Subtle parallax effect
          ),
        ),
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: theme.colorScheme.surface,
                iconTheme: IconThemeData(
                    size: 35.0, color: theme.colorScheme.onSurface),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.colorScheme.primary.withOpacity(0.5),
                          theme.colorScheme.secondary.withOpacity(0.5),
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            "My Works",
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 40.0,
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            "Showcasing My Projects",
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pinned: false,
                floating: true,
              ),
            ];
          },
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/portfolio.png",
                    fit: BoxFit.contain,
                    height: 150.0,
                    width: 300.0,
                  ),
                  SizedBox(height: 30.0),
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
                  SizedBox(height: 30.0),
                  SansBold("Budget App", 20.0),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Sans(
                        "Deployed on Android, iOS, and Web, the Budget App lets users track income and expenses easily with a clean Flutter UI and secure Firebase backend",
                        15.0),
                  ),
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/weather.png",
                    fit: BoxFit.contain,
                    height: 150.0,
                    width: 200.0,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("Weather App", 20.0),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Sans(
                        "Deployed on Android, iOS, the Weather App provides real-time updates with a sleek Flutter UI.",
                        15.0),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
