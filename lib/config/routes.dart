import 'package:flutter/material.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/models/direction.dart';
import 'package:rosseti/pages/chat/new_theme_page.dart';
import 'package:rosseti/pages/chat/theme_list_page.dart';
import 'package:rosseti/pages/chat/theme_page.dart';
import 'package:rosseti/pages/home/home_page.dart';
import 'package:rosseti/pages/loading/loading_page.dart';
import 'package:rosseti/pages/login/login_page.dart';
import 'package:rosseti/pages/proposal/new_proposal_page.dart';
import 'package:rosseti/pages/proposal/proposal_page.dart';
import 'package:rosseti/pages/user/user_info_page.dart';

abstract class Routes {
  static String initialRoute = loadingPageRoute;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loadingPageRoute:
        return _materialPageRoute(LoadingPage());
      case homePageRoute:
        return _materialPageRoute(HomePage());
      case loginPageRoute:
        return _materialPageRoute(LoginPage());
      case userInfoPageRoute:
        return _materialPageRoute(UserInfoPage());
      case newProposalPageRoute:
        final lastId = settings.arguments as String;
        return _materialPageRoute(NewProposalPage(
          lastId: lastId,
        ));
      case proposalPageRoute:
        final id = settings.arguments as String;
        return _materialPageRoute(ProposalPage(id: id));
      case themeListPageRoute:
        final direction = settings.arguments as Direction;
        return _materialPageRoute(ThemeListPage(
          direction: direction,
        ));
      case themePageRoute:
        final id = settings.arguments as String;
        return _materialPageRoute(ThemePage(
          themeId: id,
        ));
      case newThemePageRoute:
        final direction = settings.arguments as Direction;
        return _materialPageRoute(NewThemePage(
          direction: direction,
        ));
      default:
        return null;
    }
  }

  static MaterialPageRoute _materialPageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
