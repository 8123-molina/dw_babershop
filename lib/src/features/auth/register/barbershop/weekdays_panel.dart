import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPainel extends StatelessWidget {
  final ValueChanged<String> onDayPressed;
  const WeekdaysPainel({super.key, required this.onDayPressed});


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonDay(
                screenSize: screenSize,
                label: 'Seg',
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Ter',
                  onDayPressed: onDayPressed
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Qua',
                  onDayPressed: onDayPressed
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Qui',
                  onDayPressed: onDayPressed
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Sex',
                  onDayPressed: onDayPressed
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Sab',
                  onDayPressed: onDayPressed
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Dom',
                  onDayPressed: onDayPressed
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonDay extends StatefulWidget {
  final String label;
  final ValueChanged<String> onDayPressed;
  const ButtonDay(
      {super.key,
      required this.screenSize,
      required this.label,
      required this.onDayPressed});

  final Size screenSize;

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? ColorsConstants.white : ColorsConstants.grey;
    var buttonColor = selected ? ColorsConstants.brow : ColorsConstants.white;
    var buttonBorderColor =
        selected ? ColorsConstants.brow : ColorsConstants.grey;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          widget.onDayPressed(widget.label);
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
            width: widget.screenSize.height * 0.045,
            height: widget.screenSize.height * 0.056,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: buttonColor,
                border: Border.all(color: buttonBorderColor)),
            child: Center(
                child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ))),
      ),
    );
  }
}
