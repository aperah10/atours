import 'package:flutter/material.dart';
import 'package:khatu1/util/style.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();

  final double? elevation;
  final bool? boolLeading;
  final bool? centerTitle;
  final Widget? leading;
  final Function? onTap;
  final String? title;
  final List<Widget>? actionList;
  final Color? bgColor, txtColor;

  BaseAppBar(
      {this.boolLeading,
      this.elevation,
      this.leading,
      this.centerTitle,
      this.onTap,
      this.title,
      this.bgColor,
      this.txtColor,
      this.actionList});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? orangeColor,
      elevation: elevation,
      automaticallyImplyLeading: boolLeading ?? true,
      // leading: leading,
      leading: leading != null
          ? leading
          : boolLeading == false
              ? null
              : IconButton(
                  iconSize: 28,
                  icon: Icon(Icons.chevron_left_sharp, color: txtWhiteColor),
                  onPressed: () => Navigator.of(context).pop(),
                ),
      title: title != null
          ? Text(title!,
              style: TextStyle(
                  fontFamily: montserratMedium,
                  color: txtColor ?? txtWhiteColor))
          : null,
      centerTitle: centerTitle ?? false,
      actions: actionList,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

// ! SLIVER APP BAR
class BaseSliverBar extends StatelessWidget {
  final Widget? bottomChild;
  final double? elevation;
  final bool? boolLeading, action;

  final Widget? leading;
  final Function? onTap;
  final String? title;
  final List<Widget>? actionList;
  final Color? bgColor, txtColor;
  final double? toolBarHeight;
  BaseSliverBar(
      {Key? key,
      this.bottomChild,
      this.actionList,
      this.bgColor,
      this.boolLeading,
      this.elevation,
      this.leading,
      this.title,
      this.txtColor,
      this.action = true,
      this.toolBarHeight = 50,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: bgColor ?? orangeColor,
      floating: true,
      pinned: true,
      snap: false,
      centerTitle: true,
      // toolbarHeight:toolBarHeight ,

      elevation: elevation,
      automaticallyImplyLeading: boolLeading ?? true,
      leading: leading ?? null,
      // leading != null
      //     ? leading
      // : boolLeading == false
      //     ? null
      //     : IconButton(
      //         iconSize: 28,
      //         icon: Icon(Icons.chevron_left_sharp, color: txtWhiteColor),
      //         onPressed: () => Navigator.of(context).pop(),
      //       ),
      // title: Text(
      //   'All Category ',
      //   style: appBarTS,
      // ),
      title: title != null
          ? Text(title!,
              style: TextStyle(
                  fontFamily: montserratMedium,
                  color: txtColor ?? txtWhiteColor))
          : null,
      actions: action == true
          ? actionList ??
              [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  tooltip: 'Notification', onPressed: () {},
                  // onPressed: () => navigationPush(context, CartScreen()),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  tooltip: 'Cart', onPressed: () {},
                  // onPressed: () => navigationPush(context, CartScreen()),
                ),
              ]
          : null,
      bottom: bottomChild != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Container(child: bottomChild))
          : null,
    );
  }
}
