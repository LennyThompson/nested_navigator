// This file is code generated - do not edit
// Generated on 2022-12-30 10:41:27

import 'package:cougar_db/cougar_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nested_navigation/states/site.state.dart';

import '../providers/system_site.provider.dart';
import '../services/system_site.service.dart';

import 'filter/system_site.filter.state.dart';

class SystemSiteStateProvider extends StateNotifier<List<SystemSite>> {
  SystemSiteStateProvider(this._ref) : super([]) {
    getAll();
  }

  getAll() {
      _ref.read(systemSiteApiServiceProvider).systemSitesByCustomFilter(_ref.read(currentSystemSiteContextFilterStateProvider))
      .then(
        (list) {
          logger.info('SystemSite data update for context update');
          state = list!;
        }
      );
  }
  final Logger logger = Logger('SystemSiteStateProvider');
  final Ref _ref;
}

final systemSiteStateAllProvider = StateNotifierProvider<SystemSiteStateProvider, List<SystemSite>>((ref) {
    ref.watch(currentSystemSiteContextFilterStateProvider);
    return SystemSiteStateProvider(ref);
  }
);
class CurrentSystemSiteStateProvider extends StateNotifier<SystemSite> {
  CurrentSystemSiteStateProvider(this._ref) : super(SystemSite(cssSiteId: 0, systemId: 0, licencedOperator: ''))
  {
    updateSystemSite();
  }

  set current(SystemSite systemSite) {
    logger.info('Current SystemSite state updated');
    state = systemSite;
  }

  updateSystemSite(){
    _ref.read(systemSiteContextFilterFutureProvider.future)
      .then(
        (data) {
          state = data!.first;
          logger.info('Current SystemSite state updated - ${state.siteId}');
        }
      );
  }

  final Logger logger = Logger('CurrentSystemSiteStateProvider');
  final Ref _ref;
}

final currentSystemSiteStateProvider = StateNotifierProvider<CurrentSystemSiteStateProvider, SystemSite>(
  (ref) {
    ref.watch(currentSiteStateProvider);
    return CurrentSystemSiteStateProvider(ref);
  }
);

// This state will update when a primary key is changed, but only by directly changing the state.

class CurrentSystemSiteForPrimaryKeyStateProvider extends StateNotifier<SystemSite> {
  CurrentSystemSiteForPrimaryKeyStateProvider(this._ref) : super(SystemSite(cssSiteId: 0, systemId: 0, licencedOperator: ''));

  update(int cssSiteId, int systemId) {
    state = state.copyWith(cssSiteId: cssSiteId, systemId: systemId);
    _ref.refresh(systemSiteByPrimaryFutureProvider);
    _ref.read(systemSiteByPrimaryFutureProvider.future)
      .then(
        (value) {
          logger.info('SystemSite data update for primary key update');
          state = value!;
        }
      );
  }

  final Logger logger = Logger('CurrentSystemSiteForPrimaryKeyStateProvider');
  final Ref _ref;
}

final currentSystemSiteForPrimaryKeyStateProvider = StateNotifierProvider<CurrentSystemSiteForPrimaryKeyStateProvider, SystemSite>((ref) {
    return CurrentSystemSiteForPrimaryKeyStateProvider(ref);
  }
);


