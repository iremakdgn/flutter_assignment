// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_assignment/models/tvmaze_model.dart' as _i5;
import 'package:flutter_assignment/view/tvmaze_detail_page.dart' as _i2;
import 'package:flutter_assignment/view/tvmaze_list_page/tvmaze_list_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    TvMazeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(routeData: routeData, child: _i1.TvMazePage());
    },
    TvMazeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TvMazeDetailRouteArgs>();
      return _i3.AdaptivePage<dynamic>(routeData: routeData, child: _i2.TvMazeDetailPage(key: args.key, model: args.model));
    }
  };

  @override
  List<_i3.RouteConfig> get routes =>
      [_i3.RouteConfig(TvMazeRoute.name, path: '/'), _i3.RouteConfig(TvMazeDetailRoute.name, path: '/tv-maze-detail-page')];
}

/// generated route for
/// [_i1.TvMazePage]
class TvMazeRoute extends _i3.PageRouteInfo<void> {
  const TvMazeRoute() : super(TvMazeRoute.name, path: '/');

  static const String name = 'TvMazeRoute';
}

/// generated route for
/// [_i2.TvMazeDetailPage]
class TvMazeDetailRoute extends _i3.PageRouteInfo<TvMazeDetailRouteArgs> {
  TvMazeDetailRoute({_i4.Key? key, required _i5.TvMazeModel model})
      : super(TvMazeDetailRoute.name, path: '/tv-maze-detail-page', args: TvMazeDetailRouteArgs(key: key, model: model));

  static const String name = 'TvMazeDetailRoute';
}

class TvMazeDetailRouteArgs {
  const TvMazeDetailRouteArgs({this.key, required this.model});

  final _i4.Key? key;

  final _i5.TvMazeModel model;

  @override
  String toString() {
    return 'TvMazeDetailRouteArgs{key: $key, model: $model}';
  }
}
