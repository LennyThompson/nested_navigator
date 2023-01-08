import 'package:cougar_db/cougar_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nested_navigation/providers/site.provider.dart';
import 'package:nested_navigation/states/account.state.dart';

import '../providers/selected_index.provider.dart';
import '../states/site.state.dart';

class HomeNavigationRail extends ConsumerWidget{
  const HomeNavigationRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedDestination = ref.watch(selectedIndex);
    Site siteSelected = ref.watch(currentSiteStateProvider);
    Account accountSelected = ref.watch(currentAccountStateProvider);
    return NavigationRail(
      destinations: [
        NavigationRailDestination(
          icon: siteSelected.id != 0 ? Icon(Icons.home_filled) : Icon(Icons.home_outlined), 
          label: siteSelected.id != 0 ? Text(siteSelected.premises) : Text('Site')
        ),
        NavigationRailDestination(
          icon: accountSelected.id != 0 ? Icon(Icons.person) : Icon(Icons.person_outline), 
          label: accountSelected.id != 0 ? Text(accountSelected.accountName!) : Text('Accounts')
        )
      ], 
      selectedIndex: selectedDestination,
      onDestinationSelected: (value) => ref.read(selectedIndex.notifier).state = value,
      labelType: NavigationRailLabelType.all,
    );
  }
  
}