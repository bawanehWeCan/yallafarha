class ApiUrl {
  static const String mainUrl = "https://yalafarha.com";

  //registration
  static const String signIn = "/api/login";
  static const String signUp = "/api/create";
  static const String socialLogIn = "/api/sociallogin";
  static const String forgetPassword = "/api/sendcode";
  static const String checkCode = '/api/checkcode';
  static const String checkCodeById = '/api/checkcodebyid';

  //ecommerce
  static const String categories = "/api/categories";
  static const String products = "/api/products";
  static const String viewProducts = "/api/products/";
  static const String category = "/api/category/";
  static const String myOrders = "/api/my-orders";
  static const String addToCart = "/api/add-to-cart";
  static const String makeOrder = "/api/add-to-cart";

  //occasions
  static const String createOccasion = "/api/wishlist/create";
  static const String addProducts = "/api/wishlist/add";
  static const String viewOccasion = "/api/wishlist/";
  static const String myOccasions = "/api/my-wishlists";
  static const String occasionCategories = "/api/occ-categories";

  //home
  static const String slider = "/api/sliders";
  static const String suppliers = "/api/suppliers";

  //payment

  //zain cash
  static const String zainCashStep1 = "/api/pay-now/";
  static const String zainCashStep2 = "/api/pay-now-otb";

  //become supplier
  static const String becomeSupplier = "/api/suppler-form";

  //stories
  static const String shareReview = "/api/story-add";
  static const String stories = "/api/story";

  //profile
  static const String changePassword = '/api/changepassword';
  static const String updateProfile = '/api/updateUser/';
  static const String updatePassword = '/api/updatepassword/';
  static const String updateUserImage = '/api/updateimage/';

  //token
  static const String deviceToken = '/api/token/';

  //paytabs
  static const String payTabsCheckOut = '/api/add-baker-wishlist';
}
