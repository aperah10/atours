import 'package:tours2/Util/style.dart';
import 'package:flutter/material.dart';

import 'card.dart';

// ! EXPANDEABLE TEXT
class ExpTxt extends StatelessWidget {
  final String txt;
  final dynamic isReadmore;
  final dynamic style;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  const ExpTxt(this.txt,
      {Key? key,
      this.fontSize,
      this.fontWeight,
      this.style,
      this.color,
      this.decoration,
      this.isReadmore = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: style ??
          TextStyle(
              decoration: decoration,
              color: color ?? null,
              fontSize: fontSize ?? 15,
              fontWeight: fontWeight ?? null,
              fontFamily: montserratMedium),
      maxLines: isReadmore ? null : 3,
      overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}

// !Icon
class IconC extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final Color? color;
  IconC({Key? key, this.icon, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size ?? 20,
        color: color ?? darkBlueColor,
      ),
    );
  }
}

// ! BUTTON
class BigButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final Color? color;
  final IconData? icon;
  final double? isize;
  final Color? icolor;

  BigButton(
      {required this.title,
      this.onTap,
      this.color,
      this.icon,
      this.icolor,
      this.isize});

  @override
  Widget build(BuildContext context) {
    return CardDecoration(
      // width: double.infinity,
      color: color ?? redColor,

      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: montserratSemiBold),
            ),
            Container(
                child: icon != null
                    ? IconC(
                        icon: icon,
                        size: isize,
                        color: icolor,
                      )
                    : null)
          ],
        ),
      ),
    );
  }
}

// ! Padding
class AllPd extends StatelessWidget {
  final double? tp;
  final double? bp;
  final double? rp;
  final double? lp;
  final double? vp;
  final double? hp;
  final double? pd;
  final bool? symPd;
  final bool? onlyPd;
  final Widget? child;
  const AllPd(
      {Key? key,
      this.child,
      this.vp,
      this.hp,
      this.tp,
      this.lp,
      this.bp,
      this.rp,
      this.pd,
      this.symPd,
      this.onlyPd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return allPd();
  }

  Widget allPd() {
    if (symPd == true) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: vp ?? 0, horizontal: hp ?? 0),
        child: child,
      );
    }

    if (onlyPd == true) {
      return Padding(
        padding: EdgeInsets.only(
            top: tp ?? 0.0,
            bottom: bp ?? 0.0,
            left: lp ?? 0.0,
            right: rp ?? 0.0),
        child: child,
      );
    }
    return Padding(
      padding: EdgeInsets.all(pd ?? 0),
      child: child,
    );
  }
}

// class MyTabButton extends StatelessWidget {
//   final VoidCallback? onTap;
//   final Color? color;
//   final Color? color2;
//   final String? label;
//   final Color? borderColor;
//   final double? width;
//   final double? height;

//   MyTabButton(
//       {this.onTap,
//       this.height,
//       this.width,
//       this.color,
//       this.borderColor,
//       this.label,
//       this.color2});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: width ?? null,
//         decoration: BoxDecoration(
//             border: Border.all(
//                 color: borderColor != null ? borderColor! : redColor, width: 1),
//             borderRadius: BorderRadius.circular(3),
//             color: color),
//         alignment: Alignment.center,
//         child: Text(
//           label!,
//           style: TextStyle(color: color2, fontFamily: montserratSemiBold),
//         ),
//       ),
//     );
//   }
// }
