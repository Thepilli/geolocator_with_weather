import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveWaterColumn extends StatefulWidget {
  const RiveWaterColumn({super.key});

  @override
  State<RiveWaterColumn> createState() => _RiveWaterColumnState();
}

class _RiveWaterColumnState extends State<RiveWaterColumn> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;

  double currentLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/rive_assets/water-bar-demo.riv',
            fit: BoxFit.cover,
            onInit: (artboard) {
              controller = StateMachineController.fromArtboard(
                artboard,
                'State Machine',
              );
              if (controller != null) {
                artboard.addController(controller!);
                inputValue = controller?.findInput('Level');
                inputValue?.change(currentLevel);
              }
            },
          ),
          Positioned(
            right: -200,
            top: 500,
            child: Transform.rotate(
              angle: pi * 1.5,
              child: SizedBox(
                width: 500,
                child: Slider(
                  value: currentLevel,
                  min: 0,
                  max: 100, // Adjust the maximum value as needed
                  onChanged: (newValue) {
                    setState(() {
                      currentLevel = newValue;
                    });
                    inputValue?.change(currentLevel);
                  },
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             currentLevel--;
          //           });
          //           inputValue?.change(currentLevel);
          //           debugPrint(currentLevel.toString());
          //         },
          //         child: Container(
          //           height: 50,
          //           width: 50,
          //           color: Colors.red,
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             currentLevel++;
          //           });
          //           inputValue?.change(currentLevel);
          //           debugPrint(currentLevel.toString());
          //         },
          //         child: Container(
          //           height: 50,
          //           width: 50,
          //           color: Colors.green,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
