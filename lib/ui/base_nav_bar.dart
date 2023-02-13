import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:yallah_farha/controller/base_nav_bar_ctrl.dart';
import 'package:yallah_farha/helper/uni_links_helper.dart';
import 'package:yallah_farha/main.dart';
import 'package:yallah_farha/network/device_token_api.dart';
import 'package:yallah_farha/ui/screens/ecommerce/ecommerce_nav_bar/products_nav_bar.dart';
import 'package:yallah_farha/ui/screens/ecommerce/my_orders.dart';
import 'package:yallah_farha/ui/screens/home/home.dart';
import 'package:yallah_farha/ui/screens/occasions/occasions.dart';
import 'package:yallah_farha/ui/screens/profile/my_profile.dart';
import 'package:yallah_farha/ui/surfaces/signin_dialog.dart';
import 'package:yallah_farha/ui/widgets/custom_nav_bar_button.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class BaseNavBar extends StatefulWidget {
  final bool? initializeLink;

  const BaseNavBar({
    Key? key,
    this.initializeLink = false,
  }) : super(key: key);

  @override
  State<BaseNavBar> createState() => _BaseNavBarState();
}

class _BaseNavBarState extends State<BaseNavBar> {
  final Color _iconColor = Colors.white;

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const OccasionsScreen(),
      // const ProductsScreen(isDrawerShown: true),
      const ProductsNavBarScreen(),
      const MyOrdersScreen(),
      const MyProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: CustomNavBaaButton(
          title: 'Home'.tr,
          icon: FontAwesomeIcons.house,
          isChosen: BaseNavBarCtrl.find.navBarController.index == 0 ? true : false,
        ),
        activeColorPrimary: _iconColor,
        inactiveColorPrimary: _iconColor,
      ),
      PersistentBottomNavBarItem(
        icon: CustomNavBaaButton(
          title: 'Occasions'.tr,
          icon: FontAwesomeIcons.calendarDays,
          isChosen: BaseNavBarCtrl.find.navBarController.index == 1 ? true : false,
        ),
        activeColorPrimary: _iconColor,
        inactiveColorPrimary: _iconColor,
      ),
      PersistentBottomNavBarItem(
        icon: CustomNavBaaButton(
          title: 'Categories'.tr,
          icon: FontAwesomeIcons.book,
          isChosen: BaseNavBarCtrl.find.navBarController.index == 2 ? true : false,
        ),
        activeColorPrimary: _iconColor,
        inactiveColorPrimary: _iconColor,
      ),
      PersistentBottomNavBarItem(
        onPressed: (value) {
          if (MySharedPreferences.isLogIn) {
            BaseNavBarCtrl.find.navBarController.index = 3;
          } else {
            CheckUserSignIn.show(context);
          }
        },
        icon: CustomNavBaaButton(
          title: 'My orders'.tr,
          icon: FontAwesomeIcons.bagShopping,
          isChosen: BaseNavBarCtrl.find.navBarController.index == 3 ? true : false,
        ),
        activeColorPrimary: _iconColor,
        inactiveColorPrimary: _iconColor,
      ),
      PersistentBottomNavBarItem(
        onPressed: (value) {
          if (MySharedPreferences.isLogIn) {
            BaseNavBarCtrl.find.navBarController.index = 4;
          } else {
            CheckUserSignIn.show(context);
          }
        },
        icon: CustomNavBaaButton(
          title: 'Account'.tr,
          icon: FontAwesomeIcons.solidUser,
          isChosen: BaseNavBarCtrl.find.navBarController.index == 4 ? true : false,
        ),
        activeColorPrimary: _iconColor,
        inactiveColorPrimary: _iconColor,
      ),
    ];
  }

  Future initLinks() async {
    if (!uniLinksHelper.isInitialized) {
      print("isInitialized:: ${uniLinksHelper.isInitialized}");
      uniLinksHelper.handleBackgroundState(context);
      await uniLinksHelper.handleTerminatedState(context);
    }
  }

  @override
  void initState() {
    super.initState();
    initLinks();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance; // Change here
    firebaseMessaging.getToken().then((token){
      DeviceTokenService().updateDeviceToken(token!);
    });
    BaseNavBarCtrl.find.navBarController = PersistentTabController(initialIndex: 0);
    BaseNavBarCtrl.find.navBarController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (!uniLinksHelper.isInitialized) {
      uniLinksHelper.sub!.cancel();
    }
    BaseNavBarCtrl.find.navBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: BaseNavBarCtrl.find.navBarController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarHeight: 60,
      confineInSafeArea: true,
      backgroundColor: Colors.grey, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEF2098),
            Color(0xFF7B3DBA),
          ],
          // colors: [
          //   BaseColors.purpleF98,
          //   BaseColors.purple3B3,
          //   BaseColors.purple6C4,
          //   BaseColors.purpleBE9,
          // ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
