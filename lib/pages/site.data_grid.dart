// This file is code generated - do not edit
// Generated on 2022-12-31 12:10:30

import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nested_navigation/states/filter/site.filter.state.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:cougar_db/cougar_db.dart' as cougar;

import 'pluto-row-with-data.dart';
import '../states/site.state.dart';

class SiteDataGrid extends ConsumerWidget {
  SiteDataGrid({Key? key}) : super(key: key);

  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
        title: 'Id', field: 'Id', type: PlutoColumnType.number(format: '####')),
    PlutoColumn(
        title: 'LicenceNumber',
        field: 'LicenceNumber',
        type: PlutoColumnType.number(format: '####')),
    PlutoColumn(
        title: 'LicenceName',
        field: 'LicenceName',
        type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'Premises', field: 'Premises', type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'Address', field: 'Address', type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'Locality', field: 'Locality', type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'StateProvince',
        field: 'StateProvince',
        type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'Country', field: 'Country', type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'PostalCode', field: 'PostalCode', type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'ContactName',
        field: 'ContactName',
        type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'Telephone', field: 'Telephone', type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'Facsimile', field: 'Facsimile', type: PlutoColumnType.text()),
    PlutoColumn(title: 'Pager', field: 'Pager', type: PlutoColumnType.text()),
    PlutoColumn(title: 'Mobile', field: 'Mobile', type: PlutoColumnType.text()),
    PlutoColumn(title: 'Email', field: 'Email', type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'LicencedOperator',
        field: 'LicencedOperator',
        type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'ApprovedEgmNumbers',
        field: 'ApprovedEgmNumbers',
        type: PlutoColumnType.number(format: '####')),
    PlutoColumn(
        title: 'LicenceType',
        field: 'LicenceType',
        type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'LicenceStatus',
        field: 'LicenceStatus',
        type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'LicenceDate',
        field: 'LicenceDate',
        type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss')),
    PlutoColumn(
        title: 'ExpiryDate',
        field: 'ExpiryDate',
        type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss')),
    PlutoColumn(
        title: 'StatisticalDivision',
        field: 'StatisticalDivision',
        type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'ApprovedLocationId',
        field: 'ApprovedLocationId',
        type: PlutoColumnType.number(format: '####')),
    PlutoColumn(
        title: 'Jurisdiction',
        field: 'Jurisdiction',
        type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'JurisdictionId',
        field: 'JurisdictionId',
        type: PlutoColumnType.number(format: '####'))
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listSites = ref.watch(siteStateAllProvider);
    if (listSites.isEmpty) {
      return const Center(
          child: SizedBox(
              height: 200,
              width: 200,
              child: Center(child: CircularProgressIndicator())));
    }
    return PlutoGrid(
      columns: columns,
      rows: listSites
          .map((data) => PlutoRowWithData<cougar.Site>(cells: {
                'Id': PlutoCell(value: data.id),
                'LicenceNumber': PlutoCell(value: data.licenceNumber),
                'LicenceName': PlutoCell(value: data.licenceName),
                'Premises': PlutoCell(value: data.premises),
                'Address': PlutoCell(value: data.address),
                'Locality': PlutoCell(value: data.locality),
                'StateProvince': PlutoCell(value: data.stateProvince),
                'Country': PlutoCell(value: data.country),
                'PostalCode': PlutoCell(value: data.postalCode),
                'ContactName': PlutoCell(value: data.contactName),
                'Telephone': PlutoCell(value: data.telephone),
                'Facsimile': PlutoCell(value: data.facsimile),
                'Pager': PlutoCell(value: data.pager),
                'Mobile': PlutoCell(value: data.mobile),
                'Email': PlutoCell(value: data.email),
                'LicencedOperator': PlutoCell(value: data.licencedOperator),
                'ApprovedEgmNumbers': PlutoCell(value: data.approvedEgmNumbers),
                'LicenceType': PlutoCell(value: data.licenceType),
                'LicenceStatus': PlutoCell(value: data.licenceStatus),
                'LicenceDate': PlutoCell(value: data.licenceDate),
                'ExpiryDate': PlutoCell(value: data.expiryDate),
                'StatisticalDivision':
                    PlutoCell(value: data.statisticalDivision),
                'ApprovedLocationId': PlutoCell(value: data.approvedLocationId),
                'Jurisdiction': PlutoCell(value: data.jurisdiction),
                'JurisdictionId': PlutoCell(value: data.jurisdictionId)
              }, data: data, sortIdx: 1))
          .toList(),
      onRowSecondaryTap: (event) {
        double left = event.offset.dx;
        double top = event.offset.dy;
        showMenu(
            context: context,
            position: RelativeRect.fromLTRB(left, top, 1000, 1000),
            items: [
              PopupMenuItem(
                child: const Text("Set current Site"),
                onTap: () {
                  PlutoRowWithData<cougar.Site> siteRow =
                      event.row as PlutoRowWithData<cougar.Site>;
                  ref.read(currentSiteStateProvider.notifier).current =
                      siteRow.data;
                  ref.read(currentSiteFilterStateProvider.notifier).setId(Filter<int>(true, siteRow.data.id, FilterType.equals, 0));
                },
              )
            ]);
      },
      onLoaded: (PlutoGridOnLoadedEvent event) {},
      onChanged: (PlutoGridOnChangedEvent event) {
        print(event);
      },
      configuration: const PlutoGridConfiguration(),
    );
  }
}
