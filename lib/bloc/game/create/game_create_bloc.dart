import 'package:bloc/bloc.dart';
import 'package:latihan_api_demo/params/game_param.dart';
import 'package:latihan_api_demo/repository/game_repository.dart';
import 'package:latihan_api_demo/response/game_params_response.dart';
import 'package:meta/meta.dart';

part 'game_create_event.dart';
part 'game_create_state.dart';

class GameCreateBloc extends Bloc<GameCreateEvent, GameCreateState> {
  final gameRepository = GameRepository();

  GameCreateBloc() : super(GameCreateInitial()) {
    on<AddGameEvent>(_addGameEvent);
  }

  void _addGameEvent(AddGameEvent event, Emitter<GameCreateState> emit) async {
    try {
      final param = GameParam(name: event.gameParam.name, price: event.gameParam.price);
      GameCreateResponse response = await gameRepository.addGame(param);
      emit(GameCreateSuccess(gameCreateResponse: response));
    } catch(e) {
      emit(GameCreateError(message: e.toString()));
    }
  }
}
