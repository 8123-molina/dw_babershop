import 'dart:developer';

import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPainel extends StatelessWidget {
  const WeekdaysPainel({super.key});

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
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Ter',
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Qua',
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Qui',
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Sex',
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Sab',
              ),
              ButtonDay(
                screenSize: screenSize,
                label: 'Dom',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonDay extends StatelessWidget {
  final String label;
  const ButtonDay({super.key, required this.screenSize, required this.label});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          log(label);
        },
        child: Container(
            width: double.infinity,
            height: screenSize.height * 0.056,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorsConstants.white,
                border: Border.all(color: ColorsConstants.grey)),
            child: Center(
                child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorsConstants.grey,
              ),
            ))),
      ),
    );
  }
}
