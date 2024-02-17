import 'package:get/get.dart';

class AppSessionService {
  AppSessionService._();

  static final AppSessionService _instance = AppSessionService._();

  static AppSessionService get instance => _instance;

  var recentSearchList = ["Gold", "Gold 5 gm", "Silver"];

  var sortBy = ["Trending Design", "New Arrival", "Popularity","Price: Low to High","Price: High to Low"];

  var materialWeights = ["Less than 2 gms","Between 2-4 gms","Between 4-6 gms","Between 6-8 gms","Above 8 gms"];
  var materialPurity = ["22k", "24K"];
}
