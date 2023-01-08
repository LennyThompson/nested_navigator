import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/selected_index.provider.dart';
import 'account.data_grid.dart';
import 'site.data_grid.dart';

class HomeContent extends ConsumerWidget{
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedDestination = ref.watch(selectedIndex);
    Widget? child;
    switch(selectedDestination)
    {
      case 0:
        child = SiteDataGrid();
        break;
      case 1:
        child = AccountDataGrid();
        break;
      default:
        child = Column(
              children: [
                Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF222222),
                ),
                child: Center(
                  child: Icon(
                    selectedDestination == 0 ? Icons.lightbulb : Icons.airplanemode_active,
                    size: 175,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Add your first bulb',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        break;
    }
    return Expanded(
        child: child,
      ); 
  }

}