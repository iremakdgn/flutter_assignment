import 'package:auto_route/auto_route.dart';
import 'package:flutter_assignment/view/tvmaze_detail_page.dart';
import 'package:flutter_assignment/view/tvmaze_list_page/tvmaze_list_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: TvMazePage, initial: true),
    AutoRoute(page: TvMazeDetailPage),
  ],
)
class $AppRouter {}
