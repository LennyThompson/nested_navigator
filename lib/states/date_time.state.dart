import 'package:cougar_db_filter/cougar_db_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimeContext {
  DateTimeContext._()
      : useDateTime = false,
        dateTime = DateTime(1900),
        dateTimeUpper = DateTime(1900),
        filterType = FilterType.equals;

  DateTimeContext(
      {required this.useDateTime,
      required this.dateTime,
      required this.dateTimeUpper,
      required this.filterType});

  DateTimeContext copyWith(
      {bool? use,
      DateTime? dateTime,
      DateTime? dateTimeUpper,
      FilterType? filterType}) {
    return DateTimeContext(
        useDateTime: use ?? useDateTime,
        dateTime: dateTime ?? this.dateTime,
        dateTimeUpper: dateTimeUpper ?? this.dateTimeUpper,
        filterType: filterType ?? this.filterType);
  }

  bool useDateTime;
  DateTime dateTime;
  DateTime dateTimeUpper;
  FilterType filterType;
}

class DateTimeContextState extends StateNotifier<DateTimeContext> {
  DateTimeContextState() : super(DateTimeContext._());

  set use(bool value) => state = state.copyWith(use: value);
  set dateTime(DateTime value) => state = state.copyWith(dateTime: value);
  set dateTimeUpper(DateTime value) =>
      state = state.copyWith(dateTimeUpper: value);
  set filterType(FilterType value) => state = state.copyWith(filterType: value);
}

final currentDateTimeContextStateProvider =
    StateNotifierProvider<DateTimeContextState, DateTimeContext>(
        (ref) => DateTimeContextState());
