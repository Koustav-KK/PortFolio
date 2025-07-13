import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/routes.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDq8_WJiiz1G-CWJ7C6wfQs9J4qcgS5428",
        authDomain: "portfolio-489-1.firebaseapp.com",
        projectId: "portfolio-489-1",
        storageBucket: "portfolio-489-1.firebasestorage.app",
        messagingSenderId: "1079547207648",
        appId: "1:1079547207648:web:58fb2e9f3fbc2a62aed585",
        measurementId: "G-NV9E274LXJ",
      ),
    );
  } else {
    GoogleFonts.config.allowRuntimeFetching = false;
    await Firebase.initializeApp();
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Removed ..loadTheme()
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    debugPrint('Current theme mode: ${themeProvider.themeMode}');
    debugPrint('Light theme surface: ${ThemeData.light().colorScheme.surface}');
    debugPrint(
        'Custom light theme surface: ${ThemeData().colorScheme.surface}');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.tealAccent,
          primary: Colors.blue.shade700,
          secondary: Colors.teal.shade500,
          tertiary: Colors.cyan.shade500,
          surface: Colors.grey[300],
          onSurface: Colors.black,
          primaryContainer: Colors.teal.shade400,
          secondaryContainer: Colors.purple.shade400,
          tertiaryContainer: Colors.cyan.shade400,
          error: Colors.redAccent.shade700,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onTertiary: Colors.grey.shade900,
          onError: Colors.white,
          surfaceContainer: Colors.grey[400],
          surfaceContainerHighest: Colors.grey[500],
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.aBeeZeeTextTheme(
          ThemeData(brightness: Brightness.light).textTheme.copyWith(
                displayLarge: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
                headlineMedium: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                bodyLarge: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                bodyMedium: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade600,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.teal.shade600,
          size: 24,
        ),
        extensions: const [
          CustomThemeExtension(
            gradient: LinearGradient(
              colors: [
                Color(0xFF00695C),
                Color(0xFF6A1B9A),
                Color(0xFF00ACC1),
                Color(0xFF283593),
                Color(0xFFBF360C),
                Color(0xFF9E9D24),
                Color(0xFFAD1457),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.2, 0.4, 0.6, 0.7, 0.85, 1.0],
            ),
          ),
        ],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.tealAccent,
          brightness: Brightness.dark,
          primary: Colors.indigo.shade800,
          secondary: Colors.cyan.shade700,
          tertiary: Colors.cyan.shade700,
          surface: Colors.grey[850],
          onSurface: Colors.grey.shade200,
          primaryContainer: Colors.teal.shade900,
          secondaryContainer: Colors.purple.shade900,
          tertiaryContainer: Colors.cyan.shade800,
          error: Colors.redAccent.shade700,
          onPrimary: Colors.grey.shade100,
          onSecondary: Colors.grey.shade100,
          onTertiary: Colors.grey.shade100,
          onError: Colors.grey.shade100,
          surfaceContainer: Colors.grey[900],
          surfaceContainerHighest: Colors.black87,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.aBeeZeeTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme.copyWith(
                displayLarge: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                headlineMedium: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade200,
                ),
                bodyLarge: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                bodyMedium: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade300,
                ),
              ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade700,
            foregroundColor: Colors.grey.shade900,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.teal.shade300,
          size: 24,
        ),
        extensions: const [
          CustomThemeExtension(
            gradient: LinearGradient(
              colors: [
                Color(0xFF00695C),
                Color(0xFF4A148C),
                Color(0xFF00ACC1),
                Color(0xFF283593),
                Color(0xFFBF360C),
                Color(0xFFAFB42B),
                Color(0xFFAD1457),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.2, 0.4, 0.6, 0.7, 0.85, 1.0],
            ),
          ),
        ],
      ),
      home: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          final isWide = MediaQuery.of(context).size.width > 800;
          return Scaffold(
            body: Navigator(
              onGenerateRoute: (settings) => Routes.generateRoute(settings),
            ),
            floatingActionButton: isWide
                ? FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                    child: Icon(
                      themeProvider.themeMode == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  )
                : null,
            floatingActionButtonLocation:
                isWide ? FloatingActionButtonLocation.endFloat : null,
          );
        },
      ),
      // Removed router-specific properties since we're using onGenerateRoute
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: '/',
    );
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final LinearGradient gradient;

  const CustomThemeExtension({required this.gradient});

  @override
  CustomThemeExtension copyWith({LinearGradient? gradient}) {
    return CustomThemeExtension(
      gradient: gradient ?? this.gradient,
    );
  }

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    // LinearGradient doesn't support direct lerp; return the same gradient
    return CustomThemeExtension(
      gradient: gradient,
    );
  }
}
