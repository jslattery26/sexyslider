# sexyslider

A sexy slider widget.

## Supported platforms

* Flutter Android
* Flutter iOS
* Flutter web
* Flutter desktop

## Installation

Add `sexyslider: ^1.0.0` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:sexyslider/sexyslider.dart';
```

## How to use

```dart
SexySlider(
    value: sliderValue,
    onChanged: (value) {
        setState(() {
            sliderValue = value;
        });
    },
),
```

## Params

```dart

SexySlider(
    value: sliderValue,
    minValue: 0,
    maxValue: 100,
    onChanged: (value) {
      setState(() {
        sliderValue = value;
      });
    },
    decoration: SexySliderDecoration(
      width: 200,
      height: 600,
      backgroundColor: Colors.black,
      valueColor: Colors.green,
      borderRadius: BorderRadius.circular(45),
    ),
),
```
## License

MIT
