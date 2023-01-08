import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedDeviceNotifier extends StateNotifier<String>{
  SelectedDeviceNotifier(super.state);

  set selectedDevice(String selectedDevice) {
    state = selectedDevice;
  }

}

final selectedDeviceProvider = StateNotifierProvider<SelectedDeviceNotifier, String>((ref) => SelectedDeviceNotifier(''));