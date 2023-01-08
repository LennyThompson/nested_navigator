// This file is code generated - do not edit
// Generated on 2022-12-30 10:41:17

import 'package:cougar_db/cougar_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../providers/account.provider.dart';
import '../services/account.service.dart';

import 'system_site.state.dart';
import 'filter/account.filter.state.dart';

class AccountStateProvider extends StateNotifier<List<Account>> {
  AccountStateProvider(this._ref) : super([]) {
    getAll();
  }

  getAll() {
      _ref.refresh(accountContextFilterFutureProvider.future)
      .then(
        (list) {
          logger.info('Account data update for context update, length = ${list!.length}');
          state = list;
        }
      );
  }
  final Logger logger = Logger('AccountStateProvider');
  final Ref _ref;
}

final accountStateAllProvider = StateNotifierProvider<AccountStateProvider, List<Account>>((ref) {
    ref.watch(currentAccountContextFilterStateProvider);
    return AccountStateProvider(ref);
  }
);
class CurrentAccountStateProvider extends StateNotifier<Account> {
  CurrentAccountStateProvider() : super(Account(id: 0, accountName: '', status: '', cashFlag: ''));

  set current(Account account) {
    logger.info('Current Account state updated');
    state = account;
  }

  final Logger logger = Logger('CurrentAccountStateProvider');
}

final currentAccountStateProvider = StateNotifierProvider<CurrentAccountStateProvider, Account>((ref) => CurrentAccountStateProvider());

// This state will update when a primary key is changed, but only by directly changing the state.

class CurrentAccountForPrimaryKeyStateProvider extends StateNotifier<Account> {
  CurrentAccountForPrimaryKeyStateProvider(this._ref) : super(Account(id: 0, accountName: '', status: '', cashFlag: ''));

  update(num id) {
    state = state.copyWith(id: id);
    _ref.refresh(accountByPrimaryFutureProvider);
    _ref.read(accountByPrimaryFutureProvider.future)
      .then(
        (value) {
          logger.info('Account data update for primary key update');
          state = value!;
        }
      );
  }

  final Logger logger = Logger('CurrentAccountForPrimaryKeyStateProvider');
  final Ref _ref;
}

final currentAccountForPrimaryKeyStateProvider = StateNotifierProvider<CurrentAccountForPrimaryKeyStateProvider, Account>((ref) {
    return CurrentAccountForPrimaryKeyStateProvider(ref);
  }
);

