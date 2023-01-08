// This file is code generated - do not edit
// Generated on 2022-12-22 15:36:17

import 'dart:convert';
import 'package:cougar_db/cougar_db.dart';
import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';


class AccountApiService{

  AccountApiService(this._ref);

  final Ref _ref;
  final Logger logger = Logger('AccountDataService');
  List<Account>? _listAccounts;
  Future<List<Account>?> allAccounts() async {
    fillAccounts();
    return _listAccounts!;
  }

  Future<List<Account>?> accountsByCustomFilter(AccountFilter filter) async {
    logger.info(filter.queryString);
    if(filter.isValid){
      await fillAccounts();
      return _listAccounts!.where(
        (account) {
          bool? bReturn;
          if(filter.useStatus ?? false){
            bReturn = account.status == filter.status!;
          }
          if(filter.useAccountName ?? false){
            if(filter.filterTypeAccountName == FilterType.like)
            {
              bReturn = account.accountName?.toLowerCase().contains(filter.accountName!.toLowerCase());
            }
            bReturn = account.accountName == filter.accountName!;
          }
          if(filter.useCreationCssSiteId ?? false){
            bReturn = account.creationCssSiteId == filter.creationCssSiteId;
          }
          if(filter.useCreationDatetime ?? false){
            switch(filter.filterTypeCreationDatetime!){
              case FilterType.between:
                bReturn = (account.creationDatetime?.compareTo(filter.creationDatetime!) ?? -1) >= 0  && (account.creationDatetime?.compareTo(filter.creationDatetimeUpper!) ?? 1) <= 0;
                break;
              case FilterType.greaterThanEquals:
                bReturn = (account.creationDatetime?.compareTo(filter.creationDatetime!) ?? -1) >= 0;
                break;
              case FilterType.equals:
                // TODO: Handle this case.
                break;
              case FilterType.greaterThan:
                // TODO: Handle this case.
                break;
              case FilterType.lessThan:
                // TODO: Handle this case.
                break;
              case FilterType.lessThanEquals:
                // TODO: Handle this case.
                break;
              case FilterType.betweenExclusive:
                // TODO: Handle this case.
                break;
              case FilterType.like:
                // TODO: Handle this case.
                break;
            }
          }
          return bReturn ?? false;
        }
      ).toList();
    }
    return [];
  }

  Future<Account?> accountByPrimaryKey(num id) async {
    var listJson = json.decode(await rootBundle.loadString('data/accounts.json'));

    List<Account> listAccounts = List<Account>.from(
        listJson.map<Account>(
            (dynamic member) => Account.fromJson(member as Map<String, dynamic>)
        ));

    return listAccounts.where((account) => account.id == id).first;
  }

  Future<Account?> accountByCreationCssSiteId(num creationCssSiteId) async {
    var listJson = json.decode(await rootBundle.loadString('data/accounts.json'));

    List<Account> listAccounts = List<Account>.from(
        listJson.map<Account>(
            (dynamic member) => Account.fromJson(member as Map<String, dynamic>)
        ));

    return listAccounts.where((account) => account.creationCssSiteId == creationCssSiteId).first;
  }

  logErrorResponse(error) {
    if (error.response != null) {
      logger.severe(error.response?.data);
      logger.severe(error.response?.headers);
      logger.severe(error.response?.requestOptions);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      logger.severe(error.requestOptions);
      logger.severe(error.message);
    }
  }

  fillAccounts() async {
    if(_listAccounts == null) {
      logger.info('Filling accounts from json...');
      var listJson = json.decode(await rootBundle.loadString('data/accounts.json'));

      logger.info('Deserialising json to Account data');
      _listAccounts = List<Account>.from(
          listJson.map<Account>(
              (dynamic member) {
                return Account.fromJson(member as Map<String, dynamic>);
              }
          ));
      logger.info('Deserialised ${_listAccounts!.length} Account data');
    }
  }
}

final accountApiServiceProvider = Provider((ref) => AccountApiService(ref));
