// This file is code generated - do not edit
// Generated on 2022-12-22 15:36:30

import 'dart:convert';
import 'package:cougar_db/cougar_db.dart';
import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';


class SystemSiteApiService{

  SystemSiteApiService(this._ref);

  final Ref _ref;
  final Logger logger = Logger('SystemSiteDataService');

  Future<List<SystemSite>?> allSystemSites() async {
    var listJson = json.decode(await rootBundle.loadString('data/system-site.json'));

    return List<SystemSite>.from(
        listJson.map<SystemSite>(
            (dynamic member) => SystemSite.fromJson(member as Map<String, dynamic>)
        ));
  }

  Future<List<SystemSite>?> systemSitesByCustomFilter(SystemSiteFilter filter) async {
    var listJson = json.decode(await rootBundle.loadString('data/system-site.json'));

    List<SystemSite> listSySites = List<SystemSite>.from(
        listJson.map<SystemSite>(
            (dynamic member) => SystemSite.fromJson(member as Map<String, dynamic>)
        ));

    return listSySites.where((sysSite) => sysSite.siteId == filter.siteId).toList();
  }

  Future<SystemSite?> systemSiteByPrimaryKey(int cssSiteId, int systemId) async {
    var listJson = json.decode(await rootBundle.loadString('data/system-site.json'));

    List<SystemSite> listSySites = List<SystemSite>.from(
        listJson.map<SystemSite>(
            (dynamic member) => SystemSite.fromJson(member as Map<String, dynamic>)
        ));

    return listSySites.where((sysSite) => sysSite.cssSiteId == cssSiteId && sysSite.systemId == systemId).first;
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

final systemSiteApiServiceProvider = Provider((ref) => SystemSiteApiService(ref));
