
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart';

class DeviceUtil{

  DeviceUtil._();

  static final DeviceUtil _instance = DeviceUtil._();

  static DeviceUtil get instance => _instance;

  late DeviceInfoPlugin _deviceInfoPlugin;
  late AndroidDeviceInfo _androidDeviceInfo;
  late IosDeviceInfo _iosDeviceInfo;

  Future<void> init()async{
    _deviceInfoPlugin = DeviceInfoPlugin();
    if(Platform.isIOS){
      _iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
    }else{
      _androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
    }
  }

  String? get deviceId{
    return Platform.isIOS?_iosDeviceInfo.identifierForVendor:_androidDeviceInfo.id;
  }

  String? get model{
    return Platform.isIOS?_iosDeviceInfo.model:_androidDeviceInfo.model;
  }

  String? get deviceName{
    return Platform.isIOS?_iosDeviceInfo.name:_androidDeviceInfo.manufacturer;
  }

  String get platform{
    return Platform.isIOS?'iOS':'Android';
  }

  String get dateTime{
    return DateTime.now().toString();
  }

  Future<String> ip()async{
    try{
      final response = await get(Uri.parse('https://api.ipify.org/'));
      return response.statusCode==200?response.body:'';
    }catch(e){
      return '';
    }
  }


}