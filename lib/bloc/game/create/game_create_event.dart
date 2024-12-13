part of 'game_create_bloc.dart';

@immutable
sealed class GameCreateEvent {}

final class AddGameEvent extends GameCreateEvent {
  final GameParam gameParam;
  AddGameEvent({required this.gameParam});
}