import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/blocs/tvmaze_bloc/tvmaze_bloc.dart';
import 'package:flutter_assignment/resources/api_repository.dart';
import 'package:flutter_assignment/routes.gr.dart';
import 'package:flutter_assignment/view/tvmaze_list_page/widgets/build_list_card.dart';
import 'package:flutter_assignment/widgets/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment/models/tvmaze_model.dart';

class TvMazePage extends StatefulWidget {
  @override
  _TvMazePageState createState() => _TvMazePageState();
}

class _TvMazePageState extends State<TvMazePage> {
  final TvMazeBloc _newsBloc = TvMazeBloc(apiRepository: ApiRepository());
  TextEditingController _textEditingController = TextEditingController();
  List<TvMazeModel> tvList = <TvMazeModel>[];

  @override
  void initState() {
    _newsBloc.add(GetTvMazeListed());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TvMaze'), actions: [
        SearchTextField(context: context, textEditingController: _textEditingController, newsBloc: _newsBloc),
      ]),
      body: _buildListTvMaze(),
    );
  }

  Widget _buildListTvMaze() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<TvMazeBloc, TvMazeState>(
          listener: (context, state) {
            if (state is TvMazeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<TvMazeBloc, TvMazeState>(
            builder: (context, state) {
              if (state is TvMazeInitial) {
                return _buildLoading();
              } else if (state is TvMazeLoading) {
                return _buildLoading();
              } else if (state is TvMazeLoaded) {
                return BuildListCard(context: context, model: state.tvMazeModel);
              } else if (state is TvMazeError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
