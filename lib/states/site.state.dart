// This file is code generated - do not edit
// Generated on 2022-12-30 10:41:26

import 'package:cougar_db/cougar_db.dart';
import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nested_navigation/states/filter/site.filter.state.dart';

import '../providers/site.provider.dart';
import '../services/site.service.dart';

class SiteStateProvider extends StateNotifier<List<Site>> {
  SiteStateProvider(this._ref) : super([]) {
    getAll();
  }

  getAll(){
    SiteFilter filter = _ref.read(currentSiteFilterStateProvider);
    if(filter.isValid){
      _ref.refresh(siteFilterFutureProvider.future)
      .then(
        (list){
          logger.info('Site data update for ${filter.queryString} update');
          state = list!;
        }
      );
    }
    else {
      _ref.read(siteApiServiceProvider).allSites()
        .then(
          (list) {
            logger.info('Site data update for all update');
            state = list!;
            // if(state.isNotEmpty) {
            //   logger.info('Setting Site data as current state value');
            //   _ref.read(currentSiteStateProvider.notifier).current = state[0];
            // }
          }
        );
    }
  }

  final Logger logger = Logger('SiteStateProvider');
  final Ref _ref;
}

final siteStateAllProvider = StateNotifierProvider<SiteStateProvider, List<Site>>(
  (ref) {
    ref.watch(currentSiteFilterStateProvider);
    return SiteStateProvider(ref);
  }
);

class CurrentSiteStateProvider extends StateNotifier<Site> {
  CurrentSiteStateProvider() : super(Site(id: 0, licenceNumber: 0, licenceName: '', premises: '', address: '', locality: '', stateProvince: '', country: '', postalCode: '', contactName: '', telephone: '', facsimile: '', pager: '', mobile: '', email: '', licencedOperator: '', licenceType: '', licenceStatus: '', statisticalDivision: '', jurisdiction: ''));

  set current(Site site) {
    logger.info('Current Site state updated');
    state = site;
  }

  final Logger logger = Logger('CurrentSiteStateProvider');
}

final currentSiteStateProvider = StateNotifierProvider<CurrentSiteStateProvider, Site>((ref) => CurrentSiteStateProvider());

// This state will update when a primary key is changed, but only by directly changing the state.

class CurrentSiteForPrimaryKeyStateProvider extends StateNotifier<Site> {
  CurrentSiteForPrimaryKeyStateProvider(this._ref) : super(Site(id: 0, licenceNumber: 0, licenceName: '', premises: '', address: '', locality: '', stateProvince: '', country: '', postalCode: '', contactName: '', telephone: '', facsimile: '', pager: '', mobile: '', email: '', licencedOperator: '', licenceType: '', licenceStatus: '', statisticalDivision: '', jurisdiction: ''));

  update(int id) {
    state = state.copyWith(id: id);
    _ref.refresh(siteByPrimaryFutureProvider.future)
      .then(
        (value) {
          logger.info('Site data update for primary key update');
          state = value!;
        }
      );
  }

  final Logger logger = Logger('CurrentSiteForPrimaryKeyStateProvider');
  final Ref _ref;
}

final currentSiteForPrimaryKeyStateProvider = StateNotifierProvider<CurrentSiteForPrimaryKeyStateProvider, Site>((ref) {
    return CurrentSiteForPrimaryKeyStateProvider(ref);
  }
);


