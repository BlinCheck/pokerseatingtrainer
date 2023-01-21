import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/widgets/transparent_inkwell.dart';

class SeatAmountPicker extends StatelessWidget {
  const SeatAmountPicker({
    required this.seatAmount,
    required this.callback,
    this.enabled = true,
    super.key,
  });

  final int seatAmount;
  final void Function(int) callback;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Stack(
        children: [
          _buildSelector(context),
          if (enabled)
            const SizedBox()
          else
            Container(
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black26,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSelector(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          if (seatAmount == 6)
            _buildSelectedValue(context, 6)
          else
            _buildUnselectedValue(context, 6),
          if (seatAmount == 9)
            _buildSelectedValue(context, 9)
          else
            _buildUnselectedValue(context, 9),
        ],
      ),
    );
  }

  Widget _buildSelectedValue(BuildContext context, int value) {
    return Expanded(
      child: TransparentInkWell(
        onTap: enabled ? () => callback(value) : null,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).primaryColor,
          ),
          alignment: Alignment.center,
          child: Text(
            '$value',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildUnselectedValue(BuildContext context, int value) {
    return Expanded(
      child: TransparentInkWell(
        onTap: enabled ? () => callback(value) : null,
        child: Center(
          child: Text(
            '$value',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
