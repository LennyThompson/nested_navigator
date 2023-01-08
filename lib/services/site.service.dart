// This file is code generated - do not edit
// Generated on 2022-12-22 15:36:29

import 'dart:convert';
import 'package:cougar_db/cougar_db.dart';
import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';


class SiteApiService{

  SiteApiService(this._ref);

  final Ref _ref;
  final Logger logger = Logger('SiteDataService');

  Future<List<Site>?> allSites() async {
    var listJson = json.decode(await rootBundle.loadString('data/sites.json'));

    return List<Site>.from(
        listJson.map<Site>(
            (dynamic member) => Site.fromJson(member as Map<String, dynamic>)
        ));
  }

  Future<List<Site>?> sitesByCustomFilter(SiteFilter filter) async {
    var listJson = json.decode(await rootBundle.loadString('data/site.json'));

    List<Site> listSites = List<Site>.from(
        listJson.map<Site>(
            (dynamic member) => SystemSite.fromJson(member as Map<String, dynamic>)
        ));

    return listSites.where(
      (site) {
        bool? bReturn;
        if(filter.useId ?? false){
          bReturn = site.id == filter.id;
        }
        if(filter.usePremises ?? false){
          if(filter.filterTypePremises == FilterType.like)
          {
            bReturn = site.premises.toLowerCase().contains(filter.premises!.toLowerCase());
          }
          bReturn = site.premises == filter.premises;
        }
        return bReturn ?? false;
      }
    )
    .toList();
  }


  Future<Site?> siteByPrimaryKey(int id) async {
    var listJson = json.decode(await rootBundle.loadString('data/site.json'));

    List<Site> listSites = List<Site>.from(
        listJson.map<Site>(
            (dynamic member) => SystemSite.fromJson(member as Map<String, dynamic>)
        ));

    return listSites.where((site) => site.id == id).first;
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
}

final siteApiServiceProvider = Provider((ref) => SiteApiService(ref));
