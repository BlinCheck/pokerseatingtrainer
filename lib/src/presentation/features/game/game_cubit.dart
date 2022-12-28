import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_state.dart';

@injectable
class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameState());

}