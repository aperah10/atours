class URLConstants {
  static const baseUrl =
      "http://bitesvilla-test.us-east-2.elasticbeanstalk.com/";

  ///API onBoarding************************************************************************
  static const loginApiUrl = baseUrl + 'api/users/login/';
  static const logoutApiUrl = baseUrl + 'api/users/logout/';
  static const signUpApiUrl = baseUrl + 'api/users/createUser/';
  static const isEmailExists = baseUrl + 'api/users/isEmailExists/';
  static const updateGoogleUser = baseUrl + 'api/users/updateGoogleUser/';

  //API ForgotPassword Email
  static const sendOtpEmail = baseUrl + 'api/users/sendOtpToEmail/';
  static const resentOtpEmail = baseUrl + 'api/users/resendOtpToEmail/';
  static const verifyOtpEmail = baseUrl + 'api/users/verifyOtpFromEmail';
  static const resetPassEmail = baseUrl + 'api/users/resetPasswordFromEmail';

  //API ForgotPassword Mobile
  static const sendOtpMbl = baseUrl + 'comm/sendOtp';
  static const resentOtpMbl = baseUrl + 'comm/resendOtp';
  static const verifyOtpMbl = baseUrl + 'comm/verifyOtp';
  static const resetPassFromMbl = baseUrl + 'api/users/resetPasswordFromPhone';

  ///API Home************************************************************************
  static const currentScreen = baseUrl + 'api/users/screen/current';
  static const userHome = baseUrl + 'api/users/userHome';
  static const getSellersDish = baseUrl + 'api/dish/sellerId';

  // ! SELLER REGISTER
  static const selSwitchScreen = baseUrl + 'api/users/screen/switch';
  static const sellerIdVerify = baseUrl + 'api/seller/sellerId';
  static const selKitchenCheckImage = baseUrl + 'api/dish/checkKitchenImage';
  static const selKitchenAddImage = baseUrl + 'api/seller/addKitchenDetails';
  static const selCheckAvailability = baseUrl + 'api/seller/availability';
  // static const sellerVerifyEntry = baseUrl + 'api/users/50';
  // ! Seller Api Register, DishAdded , Add More Dish
  static const sellerReg = baseUrl + 'api/seller/createSellerWithUpload';
  static const selDishAdd = baseUrl + 'api/dish/CreateDish';
  static const selRegFieldData = baseUrl + 'api/seller/registrationType';
  static const selDishAddMoreItem = baseUrl + 'api/dish/CreateDish';
  static const selDishFliterField = baseUrl + 'api/dish/filter/filterTypes';
  static const selMobileOtp = baseUrl + 'comm/sellerPhone/sendOtp';
  static const selverifyOtp = baseUrl + 'comm/sellerPhone/verifyOtp';
  static const selresendOtp = baseUrl + 'comm/sellerPhone/resendOtp';
  // ! Seller KITCHEN PAGE
  static const selDishOnOff = baseUrl + 'api/dish/dishOnOff';
  static const selDishDelete = baseUrl + 'api/dish/deleteDish';
  static const selGetDishHome = baseUrl + 'api/dish/sellerId';

  // ! SELLER GENERATE PROMO CODE
  static const selgeneratePromoUrl = baseUrl + 'api/seller/generatePromo';
  static const selpromoDetailsUrl = baseUrl + 'api/seller/promoDetails';
  static const seldishPromoUrl = baseUrl + 'api/seller/dishForPromo';
  static const selapplyPromoUrl = baseUrl + 'api/seller/applyPromo';

  // ! TrackOrder
  static const selTrackOrderUrl = baseUrl + 'api/order/TrackOrder';
  static const selTrackOrderStatusUrl = baseUrl + 'api/order/TrackOrderSeller';
}
