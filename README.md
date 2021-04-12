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

Since `v2.0.0`, you'll need to pass the options to `CarouselOptions`. For each option's usage you can refer to [carousel_options.dart](./lib/carousel_options.dart).

**If you pass the `height` parameter, the `aspectRatio` parameter will be ignored.**

## Build item widgets on demand

This method will save memory by building items once it becomes necessary. This way they won't be built if they're not currently meant to be visible on screen.
It can be used to build different child item widgets related to content or by item index.

```dart

CarouselSlider.builder(
  itemCount: 15,
  itemBuilder: (BuildContext context, int itemIndex) =>
    Container(
      child: Text(itemIndex.toString()),
    ),
)
```

## Carousel controller

In order to manually control the pageview's position, you can create your own `CarouselController`, and pass it to `CarouselSlider`. Then you can use the `CarouselController` instance to manipulate the position.

```dart 
class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

 @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      CarouselSlider(
        items: child,
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          initialPage: 2,
        ),
      ),
      RaisedButton(
        onPressed: () => buttonCarouselController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.linear),
        child: Text('→'),
      )
    ]
  );
}
```

## License

MIT