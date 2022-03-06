import 'package:flutter/material.dart';
import 'btn.dart';

//  ! Card Header
// class CardHeader extends StatelessWidget {
//   final double? borderall;
//   const CardHeader({Key? key, this.borderall}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CardDecoration(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Row(
//               children: [
//                 IconBtn(icon: Icons.account_circle),
//                 Btn(
//                   btnName: 'Hotel Name',
//                   // color: ,
//                 ),
//               ],
//             ),
//           ),
//           IconBtn(icon: Icons.more_horiz)
//         ],
//       ),
//     );
//   }
// }

// ! Card Decorations
class CardDecoration extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final Decoration? decoration;
  final Color? color;
  CardDecoration(
      {Key? key,
      this.height,
      this.color,
      this.width,
      this.border,
      this.borderRadius,
      this.decoration,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      height: height ?? null,
      decoration: decoration ??
          BoxDecoration(
            border: border,
            color: color ?? null,
            borderRadius: borderRadius,
          ),
      child: child,
    );
  }
}

// ! Alert Dialog Box
class AlertBox extends StatelessWidget {
  final String? title;
  final Widget? child;
  const AlertBox({Key? key, this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: AlertDialog(
                title: Center(
                    child: Text(
                  title!,
                )),
                content: child)));
  }
}
