import 'package:flutter/material.dart';
import 'package:khatu1/util/style.dart';

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
            return Img(
              imgType: 'asset',
              src: 'assets/images/COUPON.jpg',
            );
          }),
    );
  }
}

// ! Image
class Img extends StatelessWidget {
  final String? src;
  final String? imgType;
  final BoxFit? fit;
  final double? height, width;
  const Img(
      {Key? key,
      this.src,
      this.imgType = 'asset',
      this.fit,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: height ?? null,
      width: width ?? null,
      child: imgField(),
    );
  }

  Widget? imgField() {
    if (imgType == 'network') {
      return Image.network(src ?? '', fit: fit ?? null);
    }
    if (imgType == 'asset') {
      return Image.network(src ?? '', fit: fit ?? null);
    }
  }
}
