import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

@freezed
sealed class Filter with _$Filter {
  const factory Filter.directory(bool value) = DirectoryFilter;
  const factory Filter.name(String value) = NameFilter;
  const factory Filter.id(String value) = IDFilter;
}
