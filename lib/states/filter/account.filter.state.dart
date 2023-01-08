// This file is code generated - do not edit
// Generated on 2023-01-04 14:45:01

import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cougar_db/cougar_db.dart';
import 'package:logging/logging.dart';
import '../system_site.state.dart';
import '../date_time.state.dart';
import 'system_site.filter.state.dart';

class AccountFilterStateProvider extends StateNotifier<AccountFilter> {
  AccountFilterStateProvider() : super(AccountFilter());

  set useId(bool value) {
      state = state.copyWith(useId: value);
  }
  set id(num value) {
      state = state.copyWith(id: value, useId: true);
  }
  set idUpper(num value) {
      state = state.copyWith(idUpper: value, useId: true);
  }
  set idFilterType(FilterType value) {
      state = state.copyWith(filterTypeId: value);
  }
  set useCreationSystemId(bool value) {
      state = state.copyWith(useCreationSystemId: value);
  }
  set creationSystemId(int value) {
      state = state.copyWith(creationSystemId: value, useCreationSystemId: true);
  }
  set creationSystemIdUpper(int value) {
      state = state.copyWith(creationSystemIdUpper: value, useCreationSystemId: true);
  }
  set creationSystemIdFilterType(FilterType value) {
      state = state.copyWith(filterTypeCreationSystemId: value);
  }
  set useCreationCssSiteId(bool value) {
      state = state.copyWith(useCreationCssSiteId: value);
  }
  set creationCssSiteId(int value) {
      state = state.copyWith(creationCssSiteId: value, useCreationCssSiteId: true);
  }
  set creationCssSiteIdUpper(int value) {
      state = state.copyWith(creationCssSiteIdUpper: value, useCreationCssSiteId: true);
  }
  set creationCssSiteIdFilterType(FilterType value) {
      state = state.copyWith(filterTypeCreationCssSiteId: value);
  }
  set useAccountName(bool value) {
      state = state.copyWith(useAccountName: value);
  }
  set accountName(String value) {
      state = state.copyWith(accountName: value, useAccountName: true);
  }
  set accountNameUpper(String value) {
      state = state.copyWith(accountNameUpper: value, useAccountName: true);
  }
  set accountNameFilterType(FilterType value) {
      state = state.copyWith(filterTypeAccountName: value);
  }
  set useStatus(bool value) {
      state = state.copyWith(useStatus: value);
  }
  set status(String value) {
      state = state.copyWith(status: value, useStatus: true);
  }
  set statusUpper(String value) {
      state = state.copyWith(statusUpper: value, useStatus: true);
  }
  set statusFilterType(FilterType value) {
      state = state.copyWith(filterTypeStatus: value);
  }
  set useCreationDatetime(bool value) {
      state = state.copyWith(useCreationDatetime: value);
  }
  set creationDatetime(DateTime value) {
      state = state.copyWith(creationDatetime: value, useCreationDatetime: true);
  }
  set creationDatetimeUpper(DateTime value) {
      state = state.copyWith(creationDatetimeUpper: value, useCreationDatetime: true);
  }
  set creationDatetimeFilterType(FilterType value) {
      state = state.copyWith(filterTypeCreationDatetime: value);
  }
  set useExpiryDatetime(bool value) {
      state = state.copyWith(useExpiryDatetime: value);
  }
  set expiryDatetime(DateTime value) {
      state = state.copyWith(expiryDatetime: value, useExpiryDatetime: true);
  }
  set expiryDatetimeUpper(DateTime value) {
      state = state.copyWith(expiryDatetimeUpper: value, useExpiryDatetime: true);
  }
  set expiryDatetimeFilterType(FilterType value) {
      state = state.copyWith(filterTypeExpiryDatetime: value);
  }
  set useSuspendStartDatetime(bool value) {
      state = state.copyWith(useSuspendStartDatetime: value);
  }
  set suspendStartDatetime(DateTime value) {
      state = state.copyWith(suspendStartDatetime: value, useSuspendStartDatetime: true);
  }
  set suspendStartDatetimeUpper(DateTime value) {
      state = state.copyWith(suspendStartDatetimeUpper: value, useSuspendStartDatetime: true);
  }
  set suspendStartDatetimeFilterType(FilterType value) {
      state = state.copyWith(filterTypeSuspendStartDatetime: value);
  }
  set useSuspendEndDatetime(bool value) {
      state = state.copyWith(useSuspendEndDatetime: value);
  }
  set suspendEndDatetime(DateTime value) {
      state = state.copyWith(suspendEndDatetime: value, useSuspendEndDatetime: true);
  }
  set suspendEndDatetimeUpper(DateTime value) {
      state = state.copyWith(suspendEndDatetimeUpper: value, useSuspendEndDatetime: true);
  }
  set suspendEndDatetimeFilterType(FilterType value) {
      state = state.copyWith(filterTypeSuspendEndDatetime: value);
  }
  set useLastModifiedDatetime(bool value) {
      state = state.copyWith(useLastModifiedDatetime: value);
  }
  set lastModifiedDatetime(DateTime value) {
      state = state.copyWith(lastModifiedDatetime: value, useLastModifiedDatetime: true);
  }
  set lastModifiedDatetimeUpper(DateTime value) {
      state = state.copyWith(lastModifiedDatetimeUpper: value, useLastModifiedDatetime: true);
  }
  set lastModifiedDatetimeFilterType(FilterType value) {
      state = state.copyWith(filterTypeLastModifiedDatetime: value);
  }
  set useCashFlag(bool value) {
      state = state.copyWith(useCashFlag: value);
  }
  set cashFlag(String value) {
      state = state.copyWith(cashFlag: value, useCashFlag: true);
  }
  set cashFlagUpper(String value) {
      state = state.copyWith(cashFlagUpper: value, useCashFlag: true);
  }
  set cashFlagFilterType(FilterType value) {
      state = state.copyWith(filterTypeCashFlag: value);
  }
}

final currentAccountFilterStateProvider = StateNotifierProvider<AccountFilterStateProvider, AccountFilter>((ref) => AccountFilterStateProvider());

class AccountContextFilterStateProvider extends StateNotifier<AccountFilter> {
  AccountContextFilterStateProvider(this._ref) : super(const AccountFilter()){
    SystemSite sysSite = _ref.read(currentSystemSiteStateProvider);
    if(
      sysSite.cssSiteId != 0){
        logger.info("Updating the Account filter for css site id ${sysSite.cssSiteId}");
        state = state.copyWith(useCreationCssSiteId: true, creationCssSiteId: sysSite.cssSiteId, filterTypeCreationCssSiteId: FilterType.equals);
    }


    DateTimeContext contextDateTime = _ref.read(currentDateTimeContextStateProvider);
    if(contextDateTime.useDateTime){
      logger.info("Updating the Account filter for current DateTime filter");
      state = state.copyWith(
        useCreationDatetime: contextDateTime.useDateTime,
        creationDatetime: contextDateTime.dateTime,
        creationDatetimeUpper: contextDateTime.dateTimeUpper,
        filterTypeCreationDatetime: contextDateTime.filterType
      );
    }
  }

  final Logger logger = Logger('AccountContextFilterStateProvider');
  final Ref _ref;
}

final currentAccountContextFilterStateProvider = StateNotifierProvider<AccountContextFilterStateProvider, AccountFilter>(
  (ref) {
    ref.watch(currentSystemSiteStateProvider);
    ref.watch(currentDateTimeContextStateProvider);
    return AccountContextFilterStateProvider(ref);
  }
);
