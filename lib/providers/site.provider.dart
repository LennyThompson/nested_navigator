// This file is code generated - do not edit
// Generated on 2023-01-02 14:44:39

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cougar_db/cougar_db.dart';

import '../services/site.service.dart';
import '../states/site.state.dart';
import '../states/filter/site.filter.state.dart';

final siteAllFutureProvider = FutureProvider(
  (ref) async {
    return await ref.read(siteApiServiceProvider).allSites();
  }
);

final siteFilterFutureProvider = FutureProvider(
  (ref) async {
    return await ref.read(siteApiServiceProvider).sitesByCustomFilter(ref.read(currentSiteFilterStateProvider));
  }
);

final siteByPrimaryFutureProvider = FutureProvider(
  (ref) async {
    Site site = ref.read(currentSiteForPrimaryKeyStateProvider);
    return await ref.read(siteApiServiceProvider).siteByPrimaryKey(site.id);
  }
);

