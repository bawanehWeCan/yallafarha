import 'package:flutter/material.dart';
import 'package:yallah_farha/ui/widgets/notifications_badge.dart';
import 'package:yallah_farha/utils/base/decoration.dart';
import 'package:yallah_farha/utils/base/images.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(BaseImages.logo),
      actions: const [
        NotificationsBadge(),
      ],
      flexibleSpace: Container(
        decoration: BaseDecoration.baseGradient,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
