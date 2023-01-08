// This file is code generated - do not edit
// Generated on 2023-01-02 14:44:40

import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cougar_db/cougar_db.dart';

import '../services/system_site.service.dart';
import '../states/system_site.state.dart';
import '../states/filter/system_site.filter.state.dart';

final systemSiteAllFutureProvider = FutureProvider(
  (ref) async {
    return await ref.read(systemSiteApiServiceProvider).allSystemSites();
  }
);

final systemSiteFilterFutureProvider = FutureProvider(
  (ref) async {
    return await ref.read(systemSiteApiServiceProvider).systemSitesByCustomFilter(ref.read(currentSystemSiteFilterStateProvider));
  }
);

final systemSiteContextFilterFutureProvider = FutureProvider(
  (ref) async {
    SystemSiteFilter filter = ref.read(currentSystemSiteContextFilterStateProvider);
    return await ref.read(systemSiteApiServiceProvider).systemSitesByCustomFilter(filter);
  }
);

final systemSiteByPrimaryFutureProvider = FutureProvider(
  (ref) async {
    SystemSite systemSite = ref.read(currentSystemSiteForPrimaryKeyStateProvider);
    return await ref.read(systemSiteApiServiceProvider).systemSiteByPrimaryKey(systemSite.cssSiteId, systemSite.systemId);
  }
);

