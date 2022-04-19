import 'package:flutter/material.dart';
import 'package:hero_animations/hero_animations/userModel.dart';


class DetailsPage extends StatelessWidget {
  final String imgSrc;
  final int counter;
  final User user;
  const DetailsPage({Key? key, required this.imgSrc, required this.counter, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Hero(
                  tag: 'Image-src',
                  child: Image.network(
                    imgSrc,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  child: BackButton(
                    color: Colors.white,
                  ))
            ],
          ),
          Text(
              "Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior}")
        ],
      ),
    );
  }
}



