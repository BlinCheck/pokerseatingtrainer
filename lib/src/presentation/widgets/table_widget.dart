import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/domain/entity/seat_type.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_resources/locale_keys.g.dart';
import 'package:pokerseatingtrainer/src/presentation/utils/buttons_coordinates.dart';
import 'package:pokerseatingtrainer/src/utils/table_utils.dart';

const tableWidth = 300.0;

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.seatAmount,
    this.fishIndex,
    this.nextAvailableIndex,
    this.seatCallback,
  });

  final int seatAmount;
  final int? fishIndex;
  final int? nextAvailableIndex;
  final void Function(int)? seatCallback;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: seatAmount == 6
              ? const AssetImage('assets/images/table_6.jpg')
              : const AssetImage('assets/images/table_9.jpg'),
          width: tableWidth,
          height: 250,
        ),
        ..._buildButtons(context),
      ],
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    final coordinatesList =
        seatAmount == 6 ? sixTableCoordinates : nineTableCoordinates;

    return List.generate(seatAmount, (index) {
      final seatType = _getSeatType(index);

      return Positioned(
        top: coordinatesList[index].y as double,
        left: coordinatesList[index].x as double,
        child: InkWell(
          onTap: () {
            if (seatCallback != null && _getSeatType(index) == SeatType.free) {
              seatCallback!(index);
            }
          },
          child: Container(
            width: 45,
            height: 17,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: seatType == SeatType.free
                  ? Colors.transparent
                  : Colors.black54,
            ),
            child: Center(
              child: _getSeatText(
                context,
                seatType,
                index,
              ),
            ),
          ),
        ),
      );
    });
  }

  SeatType _getSeatType(int currentIndex) {
    if (fishIndex == null) {
      return SeatType.free;
    }

    if (fishIndex == currentIndex) {
      return SeatType.fish;
    }

    if ((nextAvailableIndex! > fishIndex! &&
            currentIndex > fishIndex! &&
            currentIndex < nextAvailableIndex!) ||
        (nextAvailableIndex! < fishIndex! &&
            (currentIndex < nextAvailableIndex! ||
                currentIndex > fishIndex!))) {
      return SeatType.taken;
    } else {
      return SeatType.free;
    }
  }

  Widget _getSeatText(
    BuildContext context,
    SeatType seatType,
    int currentIndex,
  ) {
    return seatType == SeatType.fish
        ? Text(
            'R',
            style: Theme.of(context).textTheme.headline1,
          )
        : seatType == SeatType.taken
            ? Text(
                _getTakenSeatText(currentIndex),
                style: Theme.of(context).textTheme.headline2,
              )
            : const Text('');
  }

  String _getTakenSeatText(int currentIndex) {
    final distance = getDistanceToFish(currentIndex, fishIndex!, seatAmount);

    return '${LocaleKeys.fish.tr()}+$distance';
  }
}
