// This file is code generated - do not edit
// Generated on 2023-01-04 14:45:10

import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SiteFilterStateProvider extends StateNotifier<SiteFilter> {
  SiteFilterStateProvider() : super(const SiteFilter());

  setId(Filter<int> filterId){
    state = state.copyWith(useId: filterId.use, id: filterId.dataLow, filterTypeId: filterId.filterType, idUpper: filterId.dataUpper);
  }
  setPremises(Filter<String> filterPremises){
    state = state.copyWith(usePremises: filterPremises.use, premises: filterPremises.dataLow, filterTypeId: filterPremises.filterType, premisesUpper: filterPremises.dataUpper);
  }
}

final currentSiteFilterStateProvider = StateNotifierProvider<SiteFilterStateProvider, SiteFilter>((ref) => SiteFilterStateProvider());

