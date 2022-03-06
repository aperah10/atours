import 'package:flutter/material.dart';
import 'package:khatu1/util/common.dart';

class Txt extends StatelessWidget {
  final String? t;
  final Color? color;
  final double? fontSize;
  final TextStyle? style;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;

  const Txt(
      {Key? key,
      this.t,
      this.color,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.maxLines,
      this.style,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      t ?? '',
      textAlign: textAlign ?? null,
      maxLines: maxLines ?? null,
      style: style ??
          TextStyle(
            decoration: decoration,
            color: color ?? null,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? null,
            fontFamily: fontFamily ?? null,
          ),
    );
  }
}

// ! Button For Everything Screen
class Btn extends StatelessWidget {
  final String? btnName;
  final dynamic onTap;
  final TextStyle? style;
  final double? width;
  final double? height;
  final Color? color;
  final Color? txtColor;
  final EdgeInsets? padding, margin;
  final Alignment? alignment;
  final Decoration? decoration;
  const Btn(
      {Key? key,
      this.alignment,
      this.btnName,
      this.color,
      this.decoration,
      this.txtColor,
      this.width,
      this.height,
      this.onTap,
      this.padding,
      this.margin,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        decoration: decoration ??
            BoxDecoration(
              shape: BoxShape.rectangle,
              color: color ?? null,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
            ),
        width: width ?? null,
        height: height ?? null,
        child: Center(
          child: Text(
            btnName ?? '',
            style: style ?? null,
            // color: txtColor ?? null,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class IconBtn extends StatelessWidget {
  final dynamic onPressed;
  final IconData? icon;
  final double? size;
  final Color? color;
  final Color? color2;
  const IconBtn(
      {Key? key, this.onPressed, this.icon, this.color2, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color2,
      ),
      iconSize: size ?? 20,
      color: color,
    );
  }
}

// @ Cart Button
class CartBtn extends StatefulWidget {
  final dynamic plusCallBack;
  final dynamic minusCallBack;
  const CartBtn({Key? key, this.plusCallBack, this.minusCallBack})
      : super(key: key);

  @override
  State<CartBtn> createState() => _CartBtnState();
}

class _CartBtnState extends State<CartBtn> {
  dynamic cartItem = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: getWidth(context) / 4,
      decoration: BoxDecoration(
          border: Border.all(width: 1), borderRadius: BorderRadius.circular(3)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: IconBtn(
                icon: Icons.remove,
                size: 20,
                onPressed: cartItem > 1
                    ? () {
                        setState(() {
                          cartItem -= 1;
                          widget.minusCallBack(cartItem);
                        });
                      }
                    : null,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Txt(
                t: ' $cartItem ',
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: IconBtn(
                icon: Icons.add,
                size: 20,
                onPressed: () {
                  setState(() {
                    cartItem += 1;
                    widget.plusCallBack(cartItem);
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
