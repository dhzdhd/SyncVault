import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_model.freezed.dart';

@freezed
abstract class ProgressModel with _$ProgressModel {
  const factory ProgressModel({
    required int percentage,
    required Duration eta,
    required double speed,
    required double completedSize,
    required double totalSize,
  }) = _ProgressModel;
}
