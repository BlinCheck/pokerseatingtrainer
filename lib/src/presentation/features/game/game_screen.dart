import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/domain/entity/play_state.dart';
import 'package:pokerseatingtrainer/src/presentation/base/cubit_state.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_resources/locale_keys.g.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_theme/app_theme_source.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_cubit.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_state.dart';
import 'package:pokerseatingtrainer/src/presentation/widgets/action_button.dart';
import 'package:pokerseatingtrainer/src/presentation/widgets/table_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  static const screenName = '/game';

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends CubitState<GameScreen, GameState, GameCubit> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeSource.backgroundColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTables(),
          Expanded(child: _buildInterface()),
        ],
      ),
    );
  }

  Widget _buildTables() {
    return observeState(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: state.settings.tablesInRow * tableWidth + 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildTableRows(state),
        ),
      );
    });
  }

  List<Widget> _buildTableRows(GameState state) {
    final tableRows = <Widget>[];

    for (var rowIndex = 0; rowIndex < state.settings.rowsAmount; rowIndex++) {
      tableRows.add(
        Row(
          children: _buildTableRow(state, rowIndex),
        ),
      );
    }

    return tableRows;
  }

  List<Widget> _buildTableRow(GameState state, int rowIndex) {
    final tables = <Widget>[];

    for (var i = 0; i < state.settings.tablesInRow; i++) {
      final tableIndex = rowIndex * state.settings.tablesInRow + i;

      if (tableIndex == state.activeTableIndex) {
        tables.add(TableWidget(
          seatAmount: state.settings.seatAmount,
          fishIndex: state.fishIndex,
          nextAvailableIndex: state.nextAvailableIndex,
          seatCallback: cubit(context).onSeatPressed,
        ));
      } else {
        tables.add(TableWidget(seatAmount: state.settings.seatAmount));
      }
    }

    return tables;
  }

  Widget _buildInterface() {
    return observeState(builder: (context, state) {
      return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: 350,
          child: ActionButton(
            onPressed: cubit(context).onPlayButtonPressed,
            text: state.playState == PlayState.stopped
                ? LocaleKeys.play.tr()
                : LocaleKeys.stop.tr(),
          ),
        ),
      );
    });
  }
}
