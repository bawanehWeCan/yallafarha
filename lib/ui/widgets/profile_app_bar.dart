import 'package:flutter/material.dart';
import 'package:yallah_farha/ui/widgets/notifications_badge.dart';
import 'package:yallah_farha/utils/base/images.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Image.asset(BaseImages.logo),
      actions: const [
        NotificationsBadge(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
