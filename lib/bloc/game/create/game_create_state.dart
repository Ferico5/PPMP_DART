part of 'game_create_bloc.dart';

@immutable
sealed class GameCreateState {}

final class GameCreateInitial extends GameCreateState {}

final class GameCreateLoading extends GameCreateState {}

final class GameCreateSuccess extends GameCreateState {
  final GameCreateResponse gameCreateResponse;
  GameCreateSuccess({required this.gameCreateResponse});
}

final class GameCreateError extends GameCreateState {
  final String message;
  GameCreateError({required this.message});
}
