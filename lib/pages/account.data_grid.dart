// This file is code generated - do not edit
// Generated on 2022-12-31 12:10:21

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:cougar_db/cougar_db.dart' as cougar;
import 'package:intl/intl.dart';

import 'pluto-row-with-data.dart';
import '../states/account.state.dart';

class AccountDataGrid extends ConsumerWidget {
    AccountDataGrid({Key? key}) : super(key: key);

  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(title: 'Id', field: 'Id', type: PlutoColumnType.number(format: '###.##')),
    PlutoColumn(title: 'CreationSystemId', field: 'CreationSystemId', type: PlutoColumnType.number(format: '####')),
    PlutoColumn(title: 'CreationCssSiteId', field: 'CreationCssSiteId', type: PlutoColumnType.number(format: '####')),
    PlutoColumn(title: 'AccountName', field: 'AccountName', type: PlutoColumnType.text()),
    PlutoColumn(title: 'Status', field: 'Status', type: PlutoColumnType.text()),
    PlutoColumn(title: 'CreationDatetime', field: 'CreationDatetime', type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss')),
    PlutoColumn(title: 'ExpiryDatetime', field: 'ExpiryDatetime', type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss')),
    PlutoColumn(title: 'SuspendStartDatetime', field: 'SuspendStartDatetime', type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss')),
    PlutoColumn(title: 'SuspendEndDatetime', field: 'SuspendEndDatetime', type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss')),
    PlutoColumn(title: 'LastModifiedDatetime', field: 'LastModifiedDatetime', type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss')),
    PlutoColumn(title: 'CashFlag', field: 'CashFlag', type: PlutoColumnType.text())
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAccounts = ref.watch(accountStateAllProvider);
    if(listAccounts.isEmpty)
    {
      return const Center(
          child: SizedBox(height: 200, width: 200, child: Center(child: CircularProgressIndicator()))
        );
    }
    return PlutoGrid(
        columns: columns,
        rows: listAccounts.map(
          (data) => PlutoRowWithData<cougar.Account>(
            cells: {
              'Id': PlutoCell(value: data.id),
              'CreationSystemId': PlutoCell(value: data.creationSystemId),
              'CreationCssSiteId': PlutoCell(value: data.creationCssSiteId),
              'AccountName': PlutoCell(value: data.accountName),
              'Status': PlutoCell(value: data.status),
              'CreationDatetime': PlutoCell(value: data.creationDatetime),
              'ExpiryDatetime': PlutoCell(value: data.expiryDatetime),
              'SuspendStartDatetime': PlutoCell(value: data.suspendStartDatetime),
              'SuspendEndDatetime': PlutoCell(value: data.suspendEndDatetime),
              'LastModifiedDatetime': PlutoCell(value: data.lastModifiedDatetime),
              'CashFlag': PlutoCell(value: data.cashFlag)
              },
              data: data, sortIdx: 1
            )
        ).toList(),
        onRowSecondaryTap: (event) {
          double left = event.offset.dx;
          double top = event.offset.dy;
          showMenu(
              context: context,
              position: RelativeRect.fromLTRB(left, top, 1000, 1000) ,
              items: [
                PopupMenuItem(
                  child: const Text("Set current Account"),
                  onTap: (){
                    PlutoRowWithData<cougar.Account> accountRow = event.row as PlutoRowWithData<cougar.Account>;
                    ref.read(currentAccountStateProvider.notifier).current = accountRow.data;
                  },
                )
              ]);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
        },
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        configuration: const PlutoGridConfiguration(
        ),
    );
  }

}

