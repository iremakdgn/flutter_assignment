import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/custom_html_viewer.dart';

import '../models/tvmaze_model.dart';

class TvMazeDetailPage extends StatefulWidget {
  final TvMazeModel model;
  const TvMazeDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  State<TvMazeDetailPage> createState() => _TvMazeDetailPageState();
}

class _TvMazeDetailPageState extends State<TvMazeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.model.name ?? ""), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.model.image == null
                ? Image.asset("assets/no_image.png", height: 250)
                : Image.network(
                    "${widget.model.image!.original}",
                    fit: BoxFit.contain,
                    height: 350,
                  ),
            SizedBox(height: 10),
            Text(
              "${widget.model.name}",
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 18.5,
              ),
            ),
            Text("Type: ${widget.model.type}"),
            Text("Language: ${widget.model.language}"),
            Text("Url: ${widget.model.url}"),
            Text("Genres: ${widget.model.genres}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomHtmlViewer(htmlContent: widget.model.summary.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
