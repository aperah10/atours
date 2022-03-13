import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImgSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        height: 150,
        // aspectRatio: 16 / 9,
        // viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 200),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width / 1.25,
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                decoration: BoxDecoration(),
                child: Pics(
                  src: 'assets/images/COUPON.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ));
          },
        );
      }).toList(),
    ));
  }
}

// ! Pics Horizontal List for Product Deatils Page
class PicHorizontalList extends StatelessWidget {
  final double? height;
  const PicHorizontalList({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      color: Colors.white,
      child: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Pics(
              src: 'assets/images/COUPON.jpg',
            );
          }),
    );
  }
}

// ! Image
class Pics extends StatelessWidget {
  final String? src;
  final bool? imgType;
  final BoxFit? fit;
  final double? height, width;
  final Color? color;
  const Pics(
      {Key? key,
      this.src,
      this.imgType = false,
      this.fit,
      this.height,
      this.color,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      //    height: height ?? null,
      // width: width ?? null,

      child: imgField(),
    );
  }

  Widget? imgField() {
    if (imgType == true) {
      return Image.network(
        src ?? '',
        fit: fit ?? null,
        height: height ?? null,
        width: width ?? null,
        color: color,
      );
    } else {
      return Image.network(
        src ?? '',
        fit: fit ?? null,
        height: height ?? null,
        width: width ?? null,
        color: color,
      );
    }
  }
}
