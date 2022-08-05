import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/tvmaze_model.dart';
import 'package:flutter_assignment/routes.gr.dart';

class BuildListCard extends StatelessWidget {
  const BuildListCard({
    super.key,
    required this.context,
    required this.model,
  });

  final BuildContext context;
  final List<TvMazeModel> model;

  @override
  Widget build(BuildContext context) {
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
}
