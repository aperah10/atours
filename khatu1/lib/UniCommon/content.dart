import 'package:flutter/material.dart';
import 'package:khatu1/util/style.dart';
import 'pics.dart';

class PicTxtContent extends StatelessWidget {
  final dynamic isReadmore;
  const PicTxtContent({Key? key, this.isReadmore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      // height: 45,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1.0, color: Colors.black),
        bottom: BorderSide(width: 1.0, color: Colors.black),
      )
          // borderRadius: BorderRadius.circular(2),
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Pics(
              src: 'assets/images/COUPON.jpg',
              height: 120,
              width: 120,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: ProdContent(
                isReadmore: isReadmore,
              ),
            ),
          ),
          Expanded(child: Container(child: ProdContent2()))
        ],
      ),
    );
  }
}

// ! Txt Column
class ProdContent extends StatelessWidget {
  final dynamic isReadmore;
  const ProdContent({Key? key, this.isReadmore = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Header',
            style: bigBoldTextStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text('Distance this is s', style: smallTextStyle),
          Row(
            children: [
              Text(
                '500',
                style: bigBoldTextStyle,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '900',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, fontSize: 14),
              ),
            ],
          ),
          Container(
              child: Text(
            'descrition  In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.',
            maxLines: isReadmore ? null : 1,
            style: smallTextStyle,
          ))
        ]);
  }
}

class ProdContent2 extends StatelessWidget {
  const ProdContent2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 50,
            margin: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.all(3),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              '4.4/ 5',
              style: bigBoldTextStyle,
            )),
        SizedBox(
          height: 20.0,
        ),
        Container(
            width: 100,
            margin: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.all(3),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              'avaiable',
              style: bigBoldTextStyle,
            )),
      ],
    );
  }
}
