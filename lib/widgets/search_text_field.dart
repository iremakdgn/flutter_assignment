import 'package:flutter/material.dart';
import 'package:flutter_assignment/blocs/tvmaze_bloc/tvmaze_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.context,
    required TextEditingController textEditingController,
    required TvMazeBloc newsBloc,
  })  : _textEditingController = textEditingController,
        _newsBloc = newsBloc,
        super(key: key);

  final BuildContext context;
  final TextEditingController _textEditingController;
  final TvMazeBloc _newsBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: TextFormField(
        autofocus: false,
        controller: _textEditingController,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "search",
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.close,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              _textEditingController.clear();
              _newsBloc.add(GetTvMazeList());
              //_search();
            },
          ),
        ),
        onChanged: (query) => _newsBloc.add(GetTvMazeSearch(query)),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
