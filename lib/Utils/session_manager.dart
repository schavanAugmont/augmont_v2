import 'package:get_storage/get_storage.dart';

class SessionManager {
  static final _storage = GetStorage("augmont");

  static void setIsLoggedIn(bool flag) {
    _storage.write(StorageKey.isUserLoggedIn, flag);
  }

  static void setToken(String token) {
    _storage.write(StorageKey.tokenKey, token);
  }

  static bool isLoggedIn() {
    return _storage.read(StorageKey.isUserLoggedIn) ?? false;
  }

  static String getToken() {
    return _storage.read(StorageKey.tokenKey) ?? "";
  }

  static void setIsGoldSelected(bool isGoldSelected) {
    _storage.write(StorageKey.isGoldSelected, isGoldSelected);
  }

  static bool getIsGoldSelected() {
    return _storage.read(StorageKey.isGoldSelected) ?? true;
  }

  static void setIsAmountEdited(bool isAmountEdited) {
    _storage.write(StorageKey.isAmountEdited, isAmountEdited);
  }

  static bool getIsAmountEdited() {
    return _storage.read(StorageKey.isAmountEdited) ?? false;
  }

  static void setIsGramEdited(bool isGramEdited) {
    _storage.write(StorageKey.isGramEdited, isGramEdited);
  }

  static bool getIsGramEdited() {
    return _storage.read(StorageKey.isGramEdited) ?? false;
  }

  static void setQuickValue(String value) {
    _storage.write(StorageKey.value, value);
  }

  static String getQuickValue() {
    return _storage.read(StorageKey.value) ?? "";
  }

  static void setAfterSignInScreen(String s) {
    _storage.write(StorageKey.afterSignInScreen, s);
  }

  static String getAfterSignInScreen() {
    return _storage.read(StorageKey.afterSignInScreen) ?? "";
  }

  static void setCloseTimeInMillis(int millisecond) {
    _storage.write(StorageKey.closeTimeInMillis, millisecond);
  }

  static int getCloseTimeInMillis() {
    return _storage.read(StorageKey.closeTimeInMillis) ?? 0;
  }

  static void clearAll() {
    final token = _storage.read(StorageKey.fcmToken) ?? '';
    _storage.erase();
    setFcmToken(token);
  }

  static void setCustomerUniqueId(String id) {
    _storage.write(StorageKey.customerUniqueIdKey, id);
  }

  static void setCustomerId(String id) {
    _storage.write(StorageKey.customerIdKey, id);
  }

  static String getCustomerId() {
    return _storage.read(StorageKey.customerIdKey) ?? "";
  }

  static void setMobileNumber(String mobileNumber) {
    _storage.write(StorageKey.mobileNumber, mobileNumber);
  }

  static String getMobileNumber() {
    return _storage.read(StorageKey.mobileNumber) ?? "";
  }

  static String? getPdfPassword() {
    var mobile = _storage.read(StorageKey.mobileNumber) ?? "";

    if (mobile.isNotEmpty) {
      return mobile.substring(mobile.length - 4, mobile.length);
    } else {
      return null;
    }
  }

  static String getAddressData() {
    return _storage.read(StorageKey.addressDetails) ?? "";
  }

  static void setAddressData(String json) {
    _storage.write(StorageKey.addressDetails, json);
  }

  static void setShippingAddress(String json) {
    _storage.write(StorageKey.shippingAddress, json);
  }

  static String getShippingAddress() {
    return _storage.read(StorageKey.shippingAddress) ?? "";
  }

  static void setBillingAddress(String json) {
    _storage.write(StorageKey.billingAddress, json);
  }

  static String getBillingAddress() {
    return _storage.read(StorageKey.billingAddress) ?? "";
  }

  static void setAddToCartRequest(String jsonEncode) {
    _storage.write(StorageKey.addToCartRequest, jsonEncode);
  }

  static String getAddToCartRequest() {
    return _storage.read(StorageKey.addToCartRequest) ?? "";
  }

  static void setDate() {
    _storage.write(
        StorageKey.date, DateTime.now().add(const Duration(days: 1)).day);
  }

  static int getDate() {
    return _storage.read(StorageKey.date) ?? DateTime.now().day;
  }

  static void setNotificationPayload(String data) {
    _storage.write(StorageKey.notificationPayload, data);
  }

  static String getNotificationPayload() {
    return _storage.read(StorageKey.notificationPayload) ?? '';
  }

  static void setFcmToken(String data) {
    _storage.write(StorageKey.fcmToken, data);
  }

  static String getFcmToken() {
    return _storage.read(StorageKey.fcmToken) ?? '';
  }

  static void setSelectedProduct(String jsonEncode) {
    _storage.write(StorageKey.selectedProduct, jsonEncode);
  }

  static String getSelectedProduct() {
    return _storage.read(StorageKey.selectedProduct) ?? "";
  }

  static void setIsFcmTokenSet(bool data) {
    _storage.write('is_fcm_set', data);
  }

  static bool isFcmTokenSet() {
    return _storage.read('is_fcm_set') ?? false;
  }

  static void setUserInfoFormDate(String jsonEncode) {
    _storage.write(StorageKey.userInformationForm, jsonEncode);
  }

  static bool needToShowForm() {
    String data = _storage.read(StorageKey.userInformationForm) ??
        DateTime.now().subtract(const Duration(hours: 4)).toString();
    final date = DateTime.parse(data);
    return DateTime.now().difference(date).inHours >= 4;
  }

  static void setUserDetail(String jsonEncode) {
    _storage.write(StorageKey.userDetailKey, jsonEncode);
  }

  static String getUserDetails() {
    String data = _storage.read(StorageKey.userDetailKey) ?? '';
    return data;
  }

  static void setOccupation(List<String> list) {
    _storage.write(StorageKey.occupationList, list);
  }

  static List<String> getOccupation() {
    return _storage.read(StorageKey.occupationList) ?? ['NA'];
  }

  static void setProductReqMsg(String jsonEncode) {
    _storage.write('prductRequestMsg', jsonEncode);
  }

  static String getProductReqMsg() {
    return _storage.read('prductRequestMsg') ?? "";
  }

  static void setIsDashSelected(bool isDashSelected) {
    _storage.write(StorageKey.isDashSelected, isDashSelected);
  }

  static bool getIsDashSelected() {
    return _storage.read(StorageKey.isDashSelected) ?? false;
  }

  static void setIsPinAdded(bool isPinAdded) {
    _storage.write(StorageKey.isPinAdded, isPinAdded);
  }

  static bool getIsPinAdded() {
    return _storage.read(StorageKey.isPinAdded) ?? true;
  }

  static void setIsBiometricAdded(bool isBiometricAdded) {
    _storage.write(StorageKey.isBiometricAdded, isBiometricAdded);
  }

  static bool getIsBiometricAdded() {
    return _storage.read(StorageKey.isBiometricAdded) ?? true;
  }


  static void setDeviceId(String deviceId) {
    _storage.write(StorageKey.deviceId, deviceId);
  }

  static String getDeviceId() {
    return _storage.read(StorageKey.deviceId) ?? "";
  }


}

class StorageKey {
  static const String userDetailKey = "userDetail";
  static const String isUserLoggedIn = "isUserLoggedIn";
  static const String mobileNumber = "mobileNumber";

  static const String isGoldSelected = "isGoldSelected";
  static const String isGramEdited = "isGramEdited";
  static const String isAmountEdited = "isAmountEdited";
  static const String afterSignInScreen = "afterSignInScreen";
  static const String value = "value";
  static const String tokenKey = "token";
  static const String customerUniqueIdKey = "customerUniqueId";
  static const String customerIdKey = "customerId";
  static const String closeTimeInMillis = "closeTimeInMillis";

  static const String addressDetails = "addressDetails";
  static const String shippingAddress = "shippingAddress";
  static const String billingAddress = "billingAddress";
  static const String addToCartRequest = "addToCartRequest";
  static const String date = "date";
  static const String notificationPayload = "notificationPayload";
  static const String fcmToken = "fcmToken";
  static const String selectedProduct = "selectedProduct";
  static const String userInformationForm = "userInformationForm";
  static const String occupationList = "occupationList";
  static const String isDashSelected = "isDashSelected";
  static const String isPinAdded = "isPinAdded";
  static const String isBiometricAdded = "isBiometricAdded";
  static const String deviceId="deviceId";
}
