import 'package:flutter/material.dart';
import 'package:khatu1/Widget/btn.dart';
import 'package:khatu1/util/style.dart';

class ItemHeader extends StatelessWidget {
  final IconData? icon1, icon2;
  final String? title;
  final double? size;
  final dynamic onPressed1, onPressed2;
  final Color? color1, color2;
  const ItemHeader(
      {Key? key,
      this.icon1,
      this.icon2,
      this.onPressed1,
      this.onPressed2,
      this.size,
      this.color1,
      this.color2,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      // height: 45,
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1),
      //   borderRadius: BorderRadius.circular(2),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  child: icon1 != null
                      ? IconButton(
                          onPressed: onPressed1,
                          icon: Icon(
                            icon1,
                          ),
                          color: color1 ?? Colors.black,
                          iconSize: size ?? 20,
                        )
                      : null),
              Text(
                title ?? '',
                style: bigBoldTextStyle,
              ),
            ],
          ),
          Container(
              child: icon2 != null
                  ? IconButton(
                      onPressed: onPressed2,
                      icon: Icon(
                        icon2,
                      ),
                      color: color2 ?? Colors.black,
                      iconSize: size ?? 20,
                    )
                  : null),
        ],
      ),
    );
  }
}

// ! ITEM FOOTER BUTTON
class ItemFooter extends StatelessWidget {
  final String? btn1, btn2, btn3;
  final dynamic onTap1, onTap2, onTap3;
  const ItemFooter(
      {Key? key,
      this.btn1,
      this.btn2,
      this.btn3,
      this.onTap1,
      this.onTap2,
      this.onTap3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1),
      //   borderRadius: BorderRadius.circular(2),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Btn(
              onTap: onTap1,
              margin: EdgeInsets.all(3),
              height: 45,
              color: Colors.green,
              txtColor: Colors.white,
              btnName: 'btn1',
            ),
          ),
          Container(
            child: btn2 != null
                ? Expanded(
                    child: Btn(
                    onTap: onTap2,
                    margin: EdgeInsets.all(3),
                    // margin: EdgeInsets.only(right: 3),
                    height: 45,
                    color: Colors.green,
                    txtColor: Colors.white,
                    btnName: btn2,
                  ))
                : null,
          ),
          Container(
            child: btn3 != null
                ? Expanded(
                    child: Btn(
                    onTap: onTap3,
                    margin: EdgeInsets.all(3),
                    // margin: EdgeInsets.only(right: 3),
                    height: 45,
                    color: Colors.green,
                    txtColor: Colors.white,
                    btnName: btn3,
                  ))
                : null,
          )
        ],
      ),
    );
  }
}
