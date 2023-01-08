import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nested_navigation/providers/navigation_provider.dart';

import '../providers/timer_provider.dart';

class WaitingPage extends ConsumerWidget {

  const WaitingPage({
    super.key,
    required this.message,
    required this.afterWaitRoute
  });

  final String message;
  final String afterWaitRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(ref.watch(timerCompleteProvider))
    {
      Future(() {
        ref.read(timerNotifierProvider.notifier).reset();
        ref.read(navigationRoute.notifier).state = afterWaitRoute;
    });
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 32),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}

