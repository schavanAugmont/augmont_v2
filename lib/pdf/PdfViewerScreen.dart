import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:augmont_v2/pdf/pdf_password_dialog_widget.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../Utils/colors.dart';
import '../Utils/strings.dart';

class PdfViewerScreen extends StatefulWidget {
  static String routeName = "/pdfViewerScreen";

  final String url;
  final String title;
  final bool showDownloadButton;
  final bool isPasswordProtected;

  const PdfViewerScreen(
      {Key? key,
      required this.url,
      this.showDownloadButton = false,
      this.isPasswordProtected = false, required this.title})
      : super(key: key);

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  var isErrorInLoading = false;

  final ReceivePort _port = ReceivePort();
  late bool _isLoading;
  late bool _permissionReady;
  late String _localPath;

  String? taskId = "";
  String? password = "";

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
    _isLoading = true;
    _permissionReady = false;
    _init();
  }

  void _init() async {
    password = '123';
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }

    _port.listen((dynamic data) {
      String? id = data[0];
      DownloadTaskStatus? status = data[1];
      int? progress = data[2];

      if (taskId != null && taskId!.isNotEmpty) {
        final bool = taskId == id;
        if (bool) {
          if (progress == 100 && status == const DownloadTaskStatus(3)) {
            showToast('File Downloaded');
          } else if (progress == 100 && status == const DownloadTaskStatus(4)) {
            showToast('Failed to download file, please try again later..');
          }
        }
      }
    });
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  var key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        key: key,
        child: Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          onPressed: () {
           Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
          //replace with our own icon data.
        ),
        title: Transform(
          // you can forcefully translate values left side using Transform
            transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
            child: Text(widget.title,
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ))),
      ),
      body: Column(
          children: [
            !isErrorInLoading
                ? Expanded(
                    flex: 1,
                    child: PDF().cachedFromUrl(
                      widget.url,
                      placeholder: (double progress) =>
                          Center(child: Text('$progress %')),
                      errorWidget: (dynamic error) =>
                          Center(child: Text(error.toString())),
                    )
                    // SfPdfViewer.network(
                    //   widget.url,
                    //   password: password,
                    //   canShowPasswordDialog: false,
                    //   onDocumentLoadFailed:
                    //       (PdfDocumentLoadFailedDetails detail) {
                    //     //Invalid Password Error
                    //     if (detail.error == 'Invalid Password Error') {
                    //       Future.delayed(const Duration(milliseconds: 500),
                    //           showPasswordDialog);
                    //       // showPasswordDialog();
                    //     } else {
                    //       setState(() {
                    //         isErrorInLoading = true;
                    //       });
                    //     }
                    //   },
                    //   onDocumentLoaded: (detail) {
                    //     print(detail.document.security);
                    //   },
                    // ),
                    )
                : Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Text(
                      Strings.somethingWentWrong,
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.bold,
                        color: secondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
          ],
        ),
      floatingActionButton: widget.showDownloadButton
          ? FloatingActionButton(
              onPressed: () async {
                if (widget.url.isNotEmpty) {
                  _permissionReady = await _checkPermission();

                  if (_permissionReady) {
                    await _prepareSaveDir();

                    taskId = (await FlutterDownloader.enqueue(
                      url: widget.url,
                      headers: {"auth": "test_for_sql_encoding"},
                      savedDir: _localPath,
                      showNotification: true,
                      openFileFromNotification: true,
                      saveInPublicStorage: true,
                    ));
                  }
                  /* await FlutterDownloader.remove(
                      taskId: taskId!, shouldDeleteContent: true);*/
                }
              },
              backgroundColor: bottomNavigationColor,
              child: const Icon(
                Icons.download,
                color: Colors.white,
              ),
            )
          : const SizedBox(),
    ));
  }

  Future<bool> _checkPermission() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt! <= 28) {
        final status = await Permission.storage.status;
        if (status != PermissionStatus.granted) {
          final result = await Permission.storage.request();
          if (result == PermissionStatus.granted) {
            return true;
          }
        } else {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        //externalStorageDirPath = await AndroidPathProvider.downloadsPath;
        /*externalStorageDirPath =
            (await getApplicationDocumentsDirectory()).absolute.path;*/
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  void showToast(String msg) {
    // Fluttertoast.showToast(
    //   msg: msg,
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM,
    //   timeInSecForIosWeb: 1,
    //   fontSize: 16.0,
    // );
  }

  void showPasswordDialog() {
    showDialog(
      builder: (ctx) => const PdfPasswordDialog(),
      barrierDismissible: false,
      context: context,
    ).then((value) {
      if (value != null && value == 'close') {
        Get.back();
        return;
      }

      if (value != null) {
        key = UniqueKey();
        password = value;
        setState(() {});
      } else {
        isErrorInLoading = true;
        setState(() {});
      }
    });
  }
}
