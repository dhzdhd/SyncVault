import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';
import 'package:syncvault/src/introduction/services/intro_service.dart';

part 'intro_controller.g.dart';

@riverpod
class RCloneDownloadController extends _$RCloneDownloadController {
  @override
  FutureOr<int> build() => Future.value(0);

  Future<void> rCloneDownload() async {
    final introSettingsNotifier = ref.read(introSettingsProvider.notifier);
    final stream = introSettingsNotifier.downloadRClone();

    state = const AsyncLoading();
    stream.listen((data) {
      state = data.match(
        (l) => AsyncError(l, StackTrace.current),
        (r) => AsyncData(r),
      );
    });
  }
}

@riverpod
class IntroSettings extends _$IntroSettings {
  final _service = IntroService();

  @override
  IntroSettingsModel build() {
    return _service.fetch();
  }

  Either<AppError, ()> setAlreadyViewed() {
    state = state.copyWith(alreadyViewed: true);
    return _service.setLocalStorage(state);
  }

  Stream<Either<AppError, int>> downloadRClone() async* {
    yield* _service.downloadRClone();
  }
}
