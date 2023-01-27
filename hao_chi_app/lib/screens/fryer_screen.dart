import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hao_chi_app/blocs/blocs.dart';
import 'dart:isolate';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:hao_chi_app/screens/example_page.dart';


// The callback function should always be a top-level function.
void startCallback() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(MyTaskHandler());
}

class MyTaskHandler extends TaskHandler {
  SendPort? _sendPort;
  int _eventCount = 0;
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;

    // You can use the getData function to get the stored data.
    final customData =
        await FlutterForegroundTask.getData<String>(key: 'customData');
    print('customData: $customData');
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
    FlutterForegroundTask.updateService(
      notificationTitle: 'MyTaskHandler',
      notificationText: 'eventCount: $_eventCount'
    );

    // Send data to the main isolate.
    sendPort?.send(_eventCount);

    _eventCount++;
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    // You can use the clearAllData function to clear all the stored data.
    await FlutterForegroundTask.clearAllData();
  }

  @override
  void onButtonPressed(String id) {
    // Called when the notification button on the Android platform is pressed.
    print('onButtonPressed >> $id');
  }

  @override
  void onNotificationPressed() {
    // Called when the notification itself on the Android platform is pressed.
    //
    // "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted for
    // this function to be called.

    // Note that the app will only route to "/resume-route" when it is exited so
    // it will usually be necessary to send a message through the send port to
    // signal it to restore state when the app is already started.
    FlutterForegroundTask.launchApp(FryerScreen.pageRoute);
    _sendPort?.send('onNotificationPressed');
  }
}



class FryerScreen extends StatefulWidget {
  const FryerScreen({Key? key}) : super(key: key);
  static String pageRoute = 'Fryer';
  @override
  State<FryerScreen> createState() => _FryerScreenState();
}




class _FryerScreenState extends State<FryerScreen> {





  ReceivePort? _receivePort;

  Future<void> _initForegroundTask() async {
    await FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'notification_channel_id',
        channelName: 'Foreground Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
          backgroundColor: Colors.orange,
        ),
        buttons: [
          const NotificationButton(id: 'sendButton', text: 'Send'),
          const NotificationButton(id: 'testButton', text: 'Test'),
        ],
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 5000,
        autoRunOnBoot: true,
        allowWifiLock: true,
      ),
      printDevLog: true,
    );
  }

  Future<bool> _startForegroundTask() async {
    // "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted for
    // onNotificationPressed function to be called.
    //
    // When the notification is pressed while permission is denied,
    // the onNotificationPressed function is not called and the app opens.
    //
    // If you do not use the onNotificationPressed or launchApp function,
    // you do not need to write this code.
    if (!await FlutterForegroundTask.canDrawOverlays) {
      final isGranted =
          await FlutterForegroundTask.openSystemAlertWindowSettings();
      if (!isGranted) {
        print('SYSTEM_ALERT_WINDOW permission denied!');
        return false;
      }
    }

    // You can save data using the saveData function.
    await FlutterForegroundTask.saveData(key: 'customData', value: 'hello');

    bool reqResult;
    if (await FlutterForegroundTask.isRunningService) {
      reqResult = await FlutterForegroundTask.restartService();
    } else {
      reqResult = await FlutterForegroundTask.startService(
        notificationTitle: 'Foreground Service is running',
        notificationText: 'Tap to return to the app',
        callback: startCallback,
      );
    }

    ReceivePort? receivePort;
    if (reqResult) {
      receivePort = await FlutterForegroundTask.receivePort;
    }

    return _registerReceivePort(receivePort);
  }

  Future<bool> _stopForegroundTask() async {
    return await FlutterForegroundTask.stopService();
  }

  bool _registerReceivePort(ReceivePort? receivePort) {
    _closeReceivePort();

    if (receivePort != null) {
      _receivePort = receivePort;
      _receivePort?.listen((message) {
        if (message is int) {
          print('eventCount: $message');
        } else if (message is String) {
          if (message == 'onNotificationPressed') {
            Navigator.of(context).pushNamed('/resume-route');
          }
        } else if (message is DateTime) {
          print('timestamp: ${message.toString()}');
        }
      });

      return true;
    }

    return false;
  }

  void _closeReceivePort() {
    _receivePort?.close();
    _receivePort = null;
  }

  T? _ambiguate<T>(T? value) => value;







  @override
  void initState() {
    super.initState();
    _initForegroundTask();
    _ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((_) async {
      // You can get the previous ReceivePort without restarting the service.
      if (await FlutterForegroundTask.isRunningService) {
        final newReceivePort = await FlutterForegroundTask.receivePort;
        _registerReceivePort(newReceivePort);
      }
    });
  }

  @override
  void dispose() {
    _closeReceivePort();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WithForegroundTask(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Foreground Task'),
          centerTitle: true,
        ),
        body: _fryerView(),
      ),
    );
 
  }
  
  Widget _fryerView (){
    final fryBloc = BlocProvider.of<FryBloc>(context);
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FryBloc, FryState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(15),
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Burner(
                                textToshow: 'Burn 1',
                                burnZise: 250,
                                color: state.isFrying[0] ? Colors.green : Colors.grey,
                                callback: () {
                                  print(state.isFrying[0]);
                                  if(!state.isFrying[0]) {
                                    _startForegroundTask();
                                    fryBloc.add(const StartFryingEvent(0));
                                    print('Will START');
                                    }
                                  else {
                                    _stopForegroundTask();
                                    fryBloc.add(const EndFryingEvent(0));
                                    print('Will END');
                                    }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Burner(
                                textToshow: 'Burn 2',
                                burnZise: 250,
                                callback: () {
                                  Navigator.pushNamed(context, ExamplePage.pageRoute);
                                },
                              ),
                            ],
                          ),
                          Burner(
                            textToshow: '3',
                            burnZise: 80,
                            callback: () {},
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Burner(
                                textToshow: 'Burn 4',
                                burnZise: 250,
                                callback: () {},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Burner(
                                textToshow: 'Burn 5',
                                burnZise: 250,
                                callback: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.center,
                height: 30,
                width: double.infinity,
                child: const Text(
                  'ADELANTE',
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Burner extends StatelessWidget {
  final VoidCallback callback;
  final String textToshow;
  final double? burnZise;
  final Color? color;
  const Burner({
    Key? key,
    required this.callback,
    required this.textToshow,
    this.burnZise = 150,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: callback,
      child: Container(
        alignment: Alignment.center,
        height: burnZise,
        width: burnZise,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: color,
        ),
        child: Text(textToshow),
      ),
    );
  }
}
















// class ExampleApp extends StatelessWidget {
//   const ExampleApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const ExamplePage(),
//         '/resume-route': (context) => const ResumeRoutePage(),
//       },
//     );
//   }
// }




// class ExamplePage extends StatefulWidget {
//   const ExamplePage({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _ExamplePageState();
// }

// class _ExamplePageState extends State<ExamplePage> {



//   ReceivePort? _receivePort;

//   Future<void> _initForegroundTask() async {
//     await FlutterForegroundTask.init(
//       androidNotificationOptions: AndroidNotificationOptions(
//         channelId: 'notification_channel_id',
//         channelName: 'Foreground Notification',
//         channelDescription:
//             'This notification appears when the foreground service is running.',
//         channelImportance: NotificationChannelImportance.LOW,
//         priority: NotificationPriority.LOW,
//         iconData: const NotificationIconData(
//           resType: ResourceType.mipmap,
//           resPrefix: ResourcePrefix.ic,
//           name: 'launcher',
//           backgroundColor: Colors.orange,
//         ),
//         buttons: [
//           const NotificationButton(id: 'sendButton', text: 'Send'),
//           const NotificationButton(id: 'testButton', text: 'Test'),
//         ],
//       ),
//       iosNotificationOptions: const IOSNotificationOptions(
//         showNotification: true,
//         playSound: false,
//       ),
//       foregroundTaskOptions: const ForegroundTaskOptions(
//         interval: 5000,
//         autoRunOnBoot: true,
//         allowWifiLock: true,
//       ),
//       printDevLog: true,
//     );
//   }

//   Future<bool> _startForegroundTask() async {
//     // "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted for
//     // onNotificationPressed function to be called.
//     //
//     // When the notification is pressed while permission is denied,
//     // the onNotificationPressed function is not called and the app opens.
//     //
//     // If you do not use the onNotificationPressed or launchApp function,
//     // you do not need to write this code.
//     if (!await FlutterForegroundTask.canDrawOverlays) {
//       final isGranted =
//           await FlutterForegroundTask.openSystemAlertWindowSettings();
//       if (!isGranted) {
//         print('SYSTEM_ALERT_WINDOW permission denied!');
//         return false;
//       }
//     }

//     // You can save data using the saveData function.
//     await FlutterForegroundTask.saveData(key: 'customData', value: 'hello');

//     bool reqResult;
//     if (await FlutterForegroundTask.isRunningService) {
//       reqResult = await FlutterForegroundTask.restartService();
//     } else {
//       reqResult = await FlutterForegroundTask.startService(
//         notificationTitle: 'Foreground Service is running',
//         notificationText: 'Tap to return to the app',
//         callback: startCallback,
//       );
//     }

//     ReceivePort? receivePort;
//     if (reqResult) {
//       receivePort = await FlutterForegroundTask.receivePort;
//     }

//     return _registerReceivePort(receivePort);
//   }

//   Future<bool> _stopForegroundTask() async {
//     return await FlutterForegroundTask.stopService();
//   }

//   bool _registerReceivePort(ReceivePort? receivePort) {
//     _closeReceivePort();

//     if (receivePort != null) {
//       _receivePort = receivePort;
//       _receivePort?.listen((message) {
//         if (message is int) {
//           print('eventCount: $message');
//         } else if (message is String) {
//           if (message == 'onNotificationPressed') {
//             Navigator.of(context).pushNamed('/resume-route');
//           }
//         } else if (message is DateTime) {
//           print('timestamp: ${message.toString()}');
//         }
//       });

//       return true;
//     }

//     return false;
//   }

//   void _closeReceivePort() {
//     _receivePort?.close();
//     _receivePort = null;
//   }

//   T? _ambiguate<T>(T? value) => value;

//   @override
//   void initState() {
//     super.initState();
//     _initForegroundTask();
//     _ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((_) async {
//       // You can get the previous ReceivePort without restarting the service.
//       if (await FlutterForegroundTask.isRunningService) {
//         final newReceivePort = await FlutterForegroundTask.receivePort;
//         _registerReceivePort(newReceivePort);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _closeReceivePort();
//     super.dispose();
//   }



//   @override
//   Widget build(BuildContext context) {
//     // A widget that prevents the app from closing when the foreground service is running.
//     // This widget must be declared above the [Scaffold] widget.
//     return WithForegroundTask(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Foreground Task'),
//           centerTitle: true,
//         ),
//         body: _buildContentView(),
//       ),
//     );
//   }

//   Widget _buildContentView() {
//     buttonBuilder(String text, {VoidCallback? onPressed}) {
//       return ElevatedButton(
//         child: Text(text),
//         onPressed: onPressed,
//       );
//     }

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           buttonBuilder('start', onPressed: _startForegroundTask),
//           buttonBuilder('stop', onPressed: _stopForegroundTask),
//         ],
//       ),
//     );
//   }

// }























// class ResumeRoutePage extends StatelessWidget {
//   const ResumeRoutePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Resume Route'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Navigate back to first route when tapped.
//             Navigator.of(context).pop();
//           },
//           child: const Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }




