import 'package:augmont_v2/Screens/Exchange/exchange_screen.dart';
import 'package:augmont_v2/Screens/More/more_screen.dart';
import 'package:augmont_v2/Screens/Shop/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controllers/main_screen_controller.dart';
import '../../Utils/colors.dart';
import '../../Utils/print_logs.dart';
import '../../Utils/session_manager.dart';
import '../../Utils/strings.dart';
import '../Home/home_screen.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/MainScreen";

  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
   return _MainBodyState();
  }
}



class _MainBodyState extends State<MainScreen> with WidgetsBindingObserver {
  late SessionManager sessionManager;

  @override
  void initState() {
    sessionManager = SessionManager();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final List<int> _navigatorKeys = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (controller) {
        return WillPopScope(
          child: Scaffold(
            body: Stack(
              children: [
                _buildOffstageNavigator(0, controller),
                _buildOffstageNavigator(1, controller),
                _buildOffstageNavigator(2, controller),
                _buildOffstageNavigator(3, controller),
                // _buildOffstageNavigator(3, controller),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: _navBarItems(),
              onTap: controller.onTap,
              currentIndex: controller.selectedIndex,
              elevation: 15,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: bottomNavigationColor,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(
                fontFamily: Strings.fontFamilyName,
                color:Colors.grey ,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: Strings.fontFamilyName,
                color: bottomNavigationColor,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
                fontSize: 10,
              ),
            ),
          ),
          onWillPop: () async {
            FocusScope.of(context).unfocus();

            final isFirstRouteInCurrentTab =
            !await Get.nestedKey(_navigatorKeys[controller.selectedIndex])!
                .currentState!
                .maybePop();

            if (isFirstRouteInCurrentTab) {
              if (controller.selectedIndex > 0) {
                if (controller.navigationQueue.length > 1) {
                  var lastIndex;

                  if (controller.navigationQueue.length >= 2) {
                    int value = controller.navigationQueue.length - 2;

                    lastIndex = controller.navigationQueue.elementAt(value);
                  } else {
                    int value = controller.navigationQueue.length - 1;
                    lastIndex = controller.navigationQueue.elementAt(value);
                  }

                  controller.updateIndex(lastIndex);

                  return false;
                } else {
                  controller.updateIndex(0);
                  return false;
                }
              }
            }
            // let system handle back button if we're on the first route
            return isFirstRouteInCurrentTab;
          },
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(Padding icon, String labelName) {
    return BottomNavigationBarItem(
      icon: icon,
      label: labelName,
    );
  }

  List<BottomNavigationBarItem> _navBarItems() {
    return [
      _buildItem(
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: ImageIcon(
              AssetImage("assets/images/ic_home.png"),
            ),
          ),
          Strings.home.toCapitalized()),
      _buildItem(
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: ImageIcon(
              AssetImage("assets/images/ic_exchange.png"),
            ),
          ),
          Strings.exchange.toCapitalized()),
      _buildItem(
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: ImageIcon(
              AssetImage("assets/images/ic_shop.png"),
            ),
          ),
          Strings.shop.toCapitalized()),
      _buildItem(
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: ImageIcon(
              AssetImage("assets/images/ic_more.png"),
            ),
          ),
          Strings.more.toCapitalized())
    ];
  }

  Widget _buildOffstageNavigator(int index, MainScreenController controller) {
    var routeBuilders = _routeBuilders[index];

    return Offstage(
      offstage: controller.selectedIndex != index,
      child: Navigator(
        key: Get.nestedKey(_navigatorKeys[index]),
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (_) => routeBuilders,
          );
        },
      ),
    );
  }


  final List<Widget> _routeBuilders = [
    const HomeScreen(),
    const ExchangeScreen(),
    const ShopScreen(),
    const MoreScreen(),
  ];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      await saveClosingTime().then((value) {
        PrintLogs.printData("Successfully saved closing time..");
      });
    } else if (state == AppLifecycleState.paused) {
      await saveClosingTime().then((value) {
        PrintLogs.printData("Successfully saved closing time..");
      });
    }
  }

  saveClosingTime() async {
    try {
      var loggedIn = await sessionManager.isLoggedIn();
      if (loggedIn) {
        var date = DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch);

        await sessionManager.setCloseTimeInMillis(date.millisecondsSinceEpoch);

        PrintLogs.printData("Date of closing " + date.toString());
      }
    } catch (e) {
      PrintLogs.printException(e);
    }
  }
}
