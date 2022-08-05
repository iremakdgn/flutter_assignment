import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/models/tvmaze_model.dart';
import 'package:flutter_assignment/resources/api_repository.dart';
part 'tvmaze_event.dart';
part 'tvmaze_state.dart';

class TvMazeBloc extends Bloc<TvMazeEvent, TvMazeState> {
  final ApiRepository _apiRepository;
  TvMazeBloc({required ApiRepository apiRepository})
      : _apiRepository = apiRepository,
        super(TvMazeInitial()) {
    on<GetTvMazeListed>(_getList);
    on<GetTvMazeSearched>(_getSearchList);
  }

  void _getList(
    GetTvMazeListed event,
    Emitter<TvMazeState> emit,
  ) async {
    try {
      emit(TvMazeLoading());
      List<TvMazeModel> mList = await _apiRepository.fetchTvMazeList();
      emit(TvMazeLoaded(mList));
    } on NetworkError {
      emit(const TvMazeError("Failed to fetch data. is your device online?"));
    }
  }

  void _getSearchList(
    GetTvMazeSearched event,
    Emitter<TvMazeState> emit,
  ) async {
    try {
      emit(TvMazeLoading());
      List<TvMazeModel> mList = await _apiRepository.search(event.query);
      emit(TvMazeLoaded(mList));
    } on NetworkError {
      emit(const TvMazeError("Failed to fetch data. is your device online?"));
    }
  }
}
