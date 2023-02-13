import 'package:get/get.dart';
import 'package:yallah_farha/controller/base_nav_bar_ctrl.dart';
import 'package:yallah_farha/controller/ecommerce/add_to_cart.dart';
import 'package:yallah_farha/controller/ecommerce/nav_bar/categories.dart';
import 'package:yallah_farha/controller/ecommerce/view_products.dart';
import 'package:yallah_farha/controller/make_order_ctrl.dart';
import 'package:yallah_farha/controller/my_order_ctrl.dart';
import 'package:yallah_farha/controller/notification_badge_ctrl.dart';
import 'package:yallah_farha/controller/occasions/occasion_categories.dart';
import 'package:yallah_farha/controller/story/share_review.dart';
import 'package:yallah_farha/controller/story/stories.dart';

class BaseNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OccasionCategoriesController());
    Get.put(CategoriesNavBarController());
    Get.put(StoriesCtrl());
    Get.put(NotificationBadgeCtrl());
    Get.put(MyOrderCtrl(), permanent: true);
    Get.put(MakeOrderCtrl(), permanent: true);
    Get.put(BaseNavBarCtrl(), permanent: true);
  }
}

// class ProductsBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.put(CategoriesController());
//     Get.lazyPut(() => CategoryController());
//   }
// }

class ViewProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewProductsController());
    Get.lazyPut(() => AddToCartCtrl());
  }
}

class ShareReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareReviewController());
  }
}
