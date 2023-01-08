// This file is code generated - do not edit
// Generated on 2023-01-04 14:45:10

import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cougar_db/cougar_db.dart';
import 'package:logging/logging.dart';
import '../site.state.dart';

class SystemSiteFilterStateProvider extends StateNotifier<SystemSiteFilter> {
  SystemSiteFilterStateProvider() : super(SystemSiteFilter());

  set useCssSiteId(bool value) {
      state = state.copyWith(useCssSiteId: value);
  }
  set cssSiteId(int value) {
      state = state.copyWith(cssSiteId: value, useCssSiteId: true);
  }
  set cssSiteIdUpper(int value) {
      state = state.copyWith(cssSiteIdUpper: value, useCssSiteId: true);
  }
  set cssSiteIdFilterType(FilterType value) {
      state = state.copyWith(filterTypeCssSiteId: value);
  }
  set useSystemId(bool value) {
      state = state.copyWith(useSystemId: value);
  }
  set systemId(int value) {
      state = state.copyWith(systemId: value, useSystemId: true);
  }
  set systemIdUpper(int value) {
      state = state.copyWith(systemIdUpper: value, useSystemId: true);
  }
  set systemIdFilterType(FilterType value) {
      state = state.copyWith(filterTypeSystemId: value);
  }
  set useSiteId(bool value) {
      state = state.copyWith(useSiteId: value);
  }
  set siteId(int value) {
      state = state.copyWith(siteId: value, useSiteId: true);
  }
  set siteIdUpper(int value) {
      state = state.copyWith(siteIdUpper: value, useSiteId: true);
  }
  set siteIdFilterType(FilterType value) {
      state = state.copyWith(filterTypeSiteId: value);
  }
  set useLicencedOperator(bool value) {
      state = state.copyWith(useLicencedOperator: value);
  }
  set licencedOperator(String value) {
      state = state.copyWith(licencedOperator: value, useLicencedOperator: true);
  }
  set licencedOperatorUpper(String value) {
      state = state.copyWith(licencedOperatorUpper: value, useLicencedOperator: true);
  }
  set licencedOperatorFilterType(FilterType value) {
      state = state.copyWith(filterTypeLicencedOperator: value);
  }
}

final currentSystemSiteFilterStateProvider = StateNotifierProvider<SystemSiteFilterStateProvider, SystemSiteFilter>((ref) => SystemSiteFilterStateProvider());

class SystemSiteContextFilterStateProvider extends StateNotifier<SystemSiteFilter> {
  SystemSiteContextFilterStateProvider(this._ref) : super(const SystemSiteFilter()){
    Site site = _ref.read(currentSiteStateProvider);
    if(
      site.id != 0){
        logger.info("Updating the SystemSite filter for site id ${site.id}");
        state = state.copyWith(useSiteId: true, siteId: site.id, filterTypeSiteId: FilterType.equals);
    }
  }

  final Logger logger = Logger('SystemSiteContextFilterStateProvider');
  final Ref _ref;
}

final currentSystemSiteContextFilterStateProvider = StateNotifierProvider<SystemSiteContextFilterStateProvider, SystemSiteFilter>(
  (ref) {
    ref.watch(currentSiteStateProvider);
    return SystemSiteContextFilterStateProvider(ref);
  }
);
