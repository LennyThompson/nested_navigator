
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PlutoRowWithData<DataType> extends PlutoRow {
  PlutoRowWithData({
    required cells,
    required this.data,
    sortIdx,
    bool checked = false,
    Key? key,
  }) : super(cells: cells, sortIdx: sortIdx, checked: checked, key: key);

  final DataType data;
}