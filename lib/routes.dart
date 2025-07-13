import 'package:flutter/material.dart';
import 'package:my_portfolio/mobile/landing_page_mobile.dart';
import 'package:my_portfolio/mobile/work_mobile.dart';
import 'package:my_portfolio/mobile/blog_mobile.dart';
import 'package:my_portfolio/web/about_web.dart';
import 'package:my_portfolio/web/contact_web.dart';
import 'package:my_portfolio/web/landing_page_web.dart';
import 'package:my_portfolio/web/work_web.dart';
import 'package:my_portfolio/web/blog_web.dart';
import 'package:my_portfolio/mobile/about_mobile.dart';
import 'package:my_portfolio/mobile/contact_mobile.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              } else {
                return LandingPageMobile();
              }
            },
          ),
        );
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return ContactWeb();
            } else {
              return ContactMobile();
            }
          }),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return AboutWeb();
            } else {
              return AboutMobile();
            }
          }),
        );
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return BlogWeb();
            } else {
              return BlogMobile();
            }
          }),
        );
      case '/works':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return WorkWeb();
            } else {
              return WorkMobile();
            }
          }),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              } else {
                return LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}
