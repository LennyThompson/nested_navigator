import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nested_navigation/providers/navigation_provider.dart';
import '../providers/timer_provider.dart';
import '../routes.dart';
import 'finished.page.dart';
import 'select_device.page.dart';
import 'waiting.page.dart';

@immutable
class SetupFlow extends ConsumerWidget {

  SetupFlow({
    super.key,
    required this.setupPageRoute,
  });

  final String setupPageRoute;

  Future<bool> _isExitDesired(BuildContext context) async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text(
                    'If you exit device setup, your progress will be lost.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Leave'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Stay'),
                  ),
                ],
              );
            }) ??
        false;
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navigatorKey = ref.watch(navigationProvider);

    void exitSetup() {
      Navigator.of(context).pop();
    }

    Route onGenerateRoute(RouteSettings settings) {
      late Widget page;
      switch (settings.name) {
        case routeDeviceSetupStartPage:
          Future(() => ref.read(timerNotifierProvider.notifier).start());
          page = const WaitingPage(
            message: 'Searching for nearby bulb...',
            afterWaitRoute: routeDeviceSetupSelectDevicePage
          );
          break;
        case routeDeviceSetupSelectDevicePage:
          page = const SelectDevicePage(
          );
          break;
        case routeDeviceSetupConnectingPage:
          Future(() => ref.read(timerNotifierProvider.notifier).start());
          page = const WaitingPage(
            message: 'Connecting...',
            afterWaitRoute: routeDeviceSetupFinishedPage
          );
          break;
        case routeDeviceSetupFinishedPage:
          page = FinishedPage(
            exitSetup,
          );
          break;
      }

      return MaterialPageRoute<dynamic>(
        builder: (context) {
          return page;
        },
        settings: settings,
      );
    }

    PreferredSizeWidget buildFlowAppBar() {
      return AppBar(
        leading: IconButton(
          onPressed: () async {
            final isConfirmed = await _isExitDesired(context);

            if (isConfirmed) {
              exitSetup();
            }
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text('Bulb Setup'),
      );
    }

    return Scaffold(
        appBar: buildFlowAppBar(),
        body: Navigator(
          key: navigatorKey,
          initialRoute: setupPageRoute,
          onGenerateRoute: onGenerateRoute,
        ),
      );
  }

  



}

