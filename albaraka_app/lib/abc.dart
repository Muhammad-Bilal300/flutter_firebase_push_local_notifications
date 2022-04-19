import 'package:albaraka_app/Constants/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> images = [
    "assets/images/lake.jpg",
    "assets/images/lake2.jpg",
    "assets/images/lake3.jpg",
  ];
 

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
            width: double.infinity,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              controller: _sliderController,
              slideBuilder: (index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.red,
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
              slideTransform: CubeTransform(perspectiveScale: 0.0020),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 32),
                // indicatorBorderColor: Colors.black,
                indicatorRadius: 3,
                currentIndicatorColor: whiteColor,
                indicatorBackgroundColor: greyColor,
              ),
              itemCount: images.length,
              initialPage: 0,
              enableAutoSlider: false,
            ),
          ),
        ],
      ),
    );
  }
}
