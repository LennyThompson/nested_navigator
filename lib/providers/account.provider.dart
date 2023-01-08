// This file is code generated - do not edit
// Generated on 2023-01-02 14:44:29

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cougar_db/cougar_db.dart';

import '../services/account.service.dart';
import '../states/account.state.dart';
import '../states/filter/account.filter.state.dart';

final accountAllFutureProvider = FutureProvider(
  (ref) async {
    return await ref.read(accountApiServiceProvider).allAccounts();
  }
);

final accountContextFilterFutureProvider = FutureProvider(
  (ref) async {
    return await ref.read(accountApiServiceProvider).accountsByCustomFilter(ref.read(currentAccountContextFilterStateProvider));
  }
);

final accountByPrimaryFutureProvider = FutureProvider(
  (ref) async {
    Account account = ref.read(currentAccountForPrimaryKeyStateProvider);
    return await ref.read(accountApiServiceProvider).accountByPrimaryKey(account.id);
  }
);

