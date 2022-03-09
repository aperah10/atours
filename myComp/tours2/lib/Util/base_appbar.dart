import 'package:tours2/Util/style.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();

  final double? elevation;
  final bool? boolLeading;
  final bool? centerTitle;
  final Widget? leading;
  final Function? onTap;
  final String? title;
  final List<Widget>? actionList;

  // ignore: use_key_in_widget_constructors
  BaseAppBar(
      {this.boolLeading,
      this.elevation,
      this.leading,
      this.centerTitle,
      this.onTap,
      this.title,
      this.actionList});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      automaticallyImplyLeading: boolLeading ?? true,
      leading: leading,
      title: title != null
          // ignore: prefer_const_constructors
          ? Text(title!, style: TextStyle(fontFamily: montserratMedium))
          : null,
      centerTitle: centerTitle ?? false,
      actions: actionList,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
