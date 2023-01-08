

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../routes.dart';

final navigationRoute = StateProvider<String>((ref) => routeDeviceSetupStart);

final GlobalKey<NavigatorState> navigation = GlobalKey<NavigatorState>();

final navigationProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  
  String route = ref.watch(navigationRoute);
  if(route != routeDeviceSetupStart)
  {
    navigation.currentState!.pushNamed(route);
  }
  return navigation;
});