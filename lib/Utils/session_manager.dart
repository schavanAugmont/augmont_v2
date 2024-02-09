import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String userDetailKey = "userDetail";
  final String isUserLoggedIn = "isUserLoggedIn";
  final String mobileNumber = "mobileNumber";

  final String isGoldSelected = "isGoldSelected";
  final String isGramEdited = "isGramEdited";
  final String isAmountEdited = "isAmountEdited";
  final String afterSignInScreen = "afterSignInScreen";
  final String value = "value";
  final String tokenKey = "token";
  final String customerUniqueIdKey = "customerUniqueId";
  final String customerIdKey = "customerId";
  final String closeTimeInMillis = "closeTimeInMillis";

  final String addressDetails = "addressDetails";
  final String shippingAddress = "shippingAddress";
  final String billingAddress = "billingAddress";
  final String addToCartRequest = "addToCartRequest";
  final String date = "date";
  final String notificationPayload = "notificationPayload";
  final String fcmToken = "fcmToken";
  final String selectedProduct = "selectedProduct";
  final String userInformationForm = "userInformationForm";
  final String occupationList = "occupationList";

  Future<void> setIsLoggedIn(bool flag) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(isUserLoggedIn, flag);
  }


  Future<void> setToken(String token) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(tokenKey, token);
  }



  Future<bool> isLoggedIn() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isUserLoggedIn) ?? false;
  }

  Future<String> getToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(tokenKey) ?? "";
  }

  Future<void> setIsGoldSelected(bool isGoldSelected) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(this.isGoldSelected, isGoldSelected);
  }

  Future<bool> getIsGoldSelected() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isGoldSelected) ?? true;
  }

  Future<void> setIsAmountEdited(bool isAmountEdited) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(this.isAmountEdited, isAmountEdited);
  }

  Future<bool> getIsAmountEdited() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isAmountEdited) ?? false;
  }

  Future<void> setIsGramEdited(bool isGramEdited) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(this.isGramEdited, isGramEdited);
  }

  Future<bool> getIsGramEdited() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isGramEdited) ?? false;
  }

  Future<void> setQuickValue(String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(this.value, value);
  }

  Future<String> getQuickValue() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(value) ?? "";
  }

  Future<void> setAfterSignInScreen(String s) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(afterSignInScreen, s);
  }

  Future<String> getAfterSignInScreen() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(afterSignInScreen) ?? "";
  }

  Future<void> setCloseTimeInMillis(int millisecond) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(closeTimeInMillis, millisecond);
  }

  Future<int> getCloseTimeInMillis() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(closeTimeInMillis) ?? 0;
  }

  Future<void> clearAll() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString(fcmToken)??'';
    preferences.clear();
    setFcmToken(token);
  }

  Future<void> setCustomerUniqueId(String id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(customerUniqueIdKey, id);
  }

  Future<void> setCustomerId(String id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(customerIdKey, id);
  }

  Future<String> getCustomerId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(customerIdKey) ?? "";
  }

  Future<void> setMobileNumber(String mobileNumber) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(this.mobileNumber, mobileNumber);
  }

  Future<String> getMobileNumber() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(mobileNumber) ?? "";
  }

   Future<String?> getPdfPassword() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var mobile = preferences.getString(mobileNumber) ?? "";

    if(mobile.isNotEmpty){
      return mobile.substring(mobile.length-4,mobile.length);
    }else{
      return null;
    }
  }

  Future<String> getAddressData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(addressDetails) ?? "";
  }

  Future<void> setAddressData(String json) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(addressDetails, json);
  }

  Future<void> setShippingAddress(String json) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(shippingAddress, json);
  }

  Future<String> getShippingAddress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(shippingAddress) ?? "";
  }

  Future<void> setBillingAddress(String json) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(billingAddress, json);
  }

  Future<String> getBillingAddress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(billingAddress) ?? "";
  }

  Future<void> setAddToCartRequest(String jsonEncode) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(addToCartRequest, jsonEncode);
  }

  Future<String> getAddToCartRequest() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(addToCartRequest) ?? "";
  }

  Future<void> setDate() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(date, DateTime.now().add(const Duration(days: 1)).day);
  }

  Future<int> getDate() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(date) ?? DateTime.now().day;
  }

  Future<void> setNotificationPayload(String data) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(notificationPayload,data);
  }

  Future<String> getNotificationPayload() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(notificationPayload) ?? '';
  }

  Future<void> setFcmToken(String data) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(fcmToken,data);
  }

  Future<String> getFcmToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(fcmToken) ?? '';
  }

  Future<void> setSelectedProduct(String jsonEncode) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(selectedProduct, jsonEncode);
  }

  Future<String> getSelectedProduct() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(selectedProduct) ?? "";
  }


  Future<void> setIsFcmTokenSet(bool data) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('is_fcm_set', data);
  }

  Future<bool> isFcmTokenSet() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('is_fcm_set') ?? false;
  }

  Future<void> setUserInfoFormDate(String jsonEncode) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userInformationForm, jsonEncode);
  }

  Future<bool> needToShowForm() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = preferences.getString(userInformationForm) ?? DateTime.now().subtract(const Duration(hours: 4)).toString();
    final date = DateTime.parse(data);
    return DateTime.now().difference(date).inHours>=4;
  }

  Future<void> setUserDetail(String jsonEncode) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userDetailKey, jsonEncode);
  }

  Future<String> getUserDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = preferences.getString(userDetailKey) ??'';
    return data;
  }

  Future<void> setOccupation(List<String> list) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList(occupationList, list);
  }

  Future<List<String>> getOccupation() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(occupationList) ?? ['NA'];
  }



  Future<void> setProductReqMsg(String jsonEncode) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('prductRequestMsg', jsonEncode);
  }

  Future<String> getProductReqMsg() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('prductRequestMsg') ?? "";
  }

}
