library sexyslider;

import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class SexySliderDecoration {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color valueColor;
  final BorderRadius borderRadius;

  const SexySliderDecoration(
      {this.width = 200,
      this.height = 600,
      this.backgroundColor = Colors.black,
      this.valueColor = Colors.green,
      this.borderRadius = BorderRadius.zero});
}

class SexySlider extends StatefulWidget {
  double value;
  double minValue;
  double maxValue;
  ScrollPhysics physics;
  Function onChanged;
  SexySliderDecoration decoration;

  SexySlider({
    required this.value,
    required this.onChanged,
    this.minValue = 0,
    this.maxValue = 100,
    this.physics = const ClampingScrollPhysics(),
    this.decoration = const SexySliderDecoration(),
  });
  @override
  _SexySliderState createState() => _SexySliderState();
}

class _SexySliderState extends State<SexySlider> {
  late ScrollController _scrollController;
  _scrollListener() {
    setState(() {
      var factor = widget.decoration.height / widget.maxValue;

      widget.onChanged(_scrollController.position.pixels / factor);
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: widget.decoration.borderRadius),
      width: widget.decoration.width,
      height: widget.decoration.height,
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: widget.physics,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: widget.decoration.backgroundColor,
              width: widget.decoration.width,
              height: widget.decoration.height,
            ),
            Container(
              color: widget.decoration.valueColor,
              width: widget.decoration.width,
              height: widget.decoration.height,
            )
          ],
        ),
      ),
    );
  }
}
