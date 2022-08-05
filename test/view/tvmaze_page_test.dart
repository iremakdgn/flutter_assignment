import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/blocs/tvmaze_bloc/tvmaze_bloc.dart';
import 'package:flutter_assignment/models/tvmaze_model.dart';
import 'package:flutter_assignment/view/tvmaze_detail_page.dart';
import 'package:flutter_assignment/view/tvmaze_list_page/tvmaze_list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTvMazeBloc extends MockBloc<TvMazeEvent, TvMazeState> implements TvMazeBloc {}

void main() {
  group('TvMazesList', () {
    testWidgets('renders TvMazeList', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TvMazePage()));
      await tester.pumpAndSettle();
      expect(find.byType(TvMazeDetailPage), findsOneWidget);
    });
  });
}
