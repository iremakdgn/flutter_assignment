import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/blocs/tvmaze_bloc/tvmaze_bloc.dart';
import 'package:flutter_assignment/resources/api_repository.dart';
import 'package:flutter_assignment/routes.gr.dart';
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
    _newsBloc.add(GetTvMazeList());
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
                return _buildCard(context, state.tvMazeModel);
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

  Widget _buildCard(BuildContext context, List<TvMazeModel> model) {
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => AutoRouter.of(context).push(TvMazeDetailRoute(model: model[index])),
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    model[index].image == null
                        ? Image.asset("assets/no_image.png", height: 250)
                        : Image.network(
                            "${model[index].image?.medium}",
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                    SizedBox(height: 10),
                    Text("Name: ${model[index].name}"),
                    Text("Type: ${model[index].type}"),
                    Text("Language: ${model[index].language}"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
