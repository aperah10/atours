import 'package:flutter/material.dart';
import 'package:khatu1/util/common.dart';

class IconWithTxt extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final TextStyle? style;
  final dynamic onPressed;
  final double? size;
  final dynamic onTap;
  final double? tRight, tLeft, bLeft, bRight;
  final double? height, width;
  final Color? color;
  const IconWithTxt(
      {Key? key,
      this.icon,
      this.onTap,
      this.height,
      this.width,
      this.onPressed,
      this.size,
      this.style,
      this.tRight,
      this.bLeft,
      this.bRight,
      this.tLeft,
      this.color,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.red,
      child: Container(
        height: height ?? 40,
        width: width ?? null,
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? Colors.orange,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(tLeft ?? 0.0),
                topRight: Radius.circular(tRight ?? 0.0),
                bottomLeft: Radius.circular(bLeft ?? 0.0),
                bottomRight: Radius.circular(bRight ?? 0.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: style ?? TextStyle(),
              textAlign: TextAlign.center,
            ),
            Container(
              child: icon != null
                  ? IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        icon,
                      ),
                      iconSize: size ?? 15)
                  : null,
            )
          ],
        ),
      ),
    );
  }
}

// ! Filter Menu
class FilterMenu extends StatelessWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: IconWithTxt(
              title: 'Sort',
              tLeft: 5.0,
              bLeft: 5.0,
              icon: Icons.arrow_upward_outlined,
            ),
          ),
          Expanded(
            child: IconWithTxt(
              title: 'relevance',
              icon: Icons.arrow_downward_outlined,
            ),
          ),
          Expanded(
            child: IconWithTxt(
                title: 'filter', tRight: 5.0, bRight: 5.0, icon: Icons.sort),
          )
        ],
      ),
    );
  }
}

// ! Services Menu Icon
class ServicesMenu extends StatelessWidget {
  const ServicesMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: IconWithTxt(
              onTap: () => print('title1'),
              title: 'title1',
              tLeft: 5.0,
              bLeft: 5.0,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: IconWithTxt(
              onTap: () => print('title2'),
              title: 'title2',
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: IconWithTxt(
              onTap: () => print('title3'),
              title: 'title3',
              tRight: 5.0,
              bRight: 5.0,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

// ! Horizontal List of Favour Menu
class FavourMenu extends StatelessWidget {
  const FavourMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: Colors.blue,
      child: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return IconWithTxt(
              title: 'Favour  $i',
              color: Colors.orange,
            );
          }),
    );
  }
}
