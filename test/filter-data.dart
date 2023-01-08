import 'package:cougar_db_filter/cougar_db_filter.dart';

class AFilter<Data>{

  AFilter(this.use, this.dataLow, this.filterType, this.dataUpper);
  bool use;
  Data dataLow;
  Data? dataUpper;
  FilterType filterType;
}