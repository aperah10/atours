import 'package:flutter/material.dart';
import 'package:tours2/Util/style.dart';
import 'compart.dart';

//  ! Card Header
class CardHeader extends StatelessWidget {
  final double? borderall;
  const CardHeader({Key? key, this.borderall}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDecoration(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                IconC(icon: Icons.account_circle),
                BigButton(
                  title: 'Hotel Name',
                  color: offWhiteColor,
                ),
              ],
            ),
          ),
          IconC(icon: Icons.more_horiz)
        ],
      ),
    );
  }
}

// ! Card Decorations
class CardDecoration extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? tr;
  final double? tl;
  final double? br;
  final double? bl;

  final double? brdWidth;

  final Color? color;
  CardDecoration(
      {Key? key,
      this.height,
      this.color,
      this.width,
      this.tr,
      this.tl,
      this.bl,
      this.br,
      this.brdWidth,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      height: height ?? null,
      decoration: BoxDecoration(
        border: brdWidth != null
            ? Border.all(
                width: brdWidth!,
              )
            : null,
        color: color ?? offWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(tl ?? 6),
          topRight: Radius.circular(tr ?? 6),
          bottomLeft: Radius.circular(bl ?? 6),
          bottomRight: Radius.circular(br ?? 6),
        ),
      ),
      child: child,
    );
  }
}
