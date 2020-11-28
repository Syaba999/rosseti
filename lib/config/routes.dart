import 'package:flutter/material.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/models/proposal.dart';
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
        return _materialPageRoute(NewProposalPage());
      case proposalPageRoute:
        final proposal = settings.arguments as Proposal;
        return _materialPageRoute(ProposalPage(proposal: proposal));
      default:
        return null;
    }
  }

  static MaterialPageRoute _materialPageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
