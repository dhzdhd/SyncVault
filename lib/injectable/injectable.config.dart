// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../src/accounts/services/providers/google_auth.dart' as _i360;
import '../src/accounts/services/rclone.dart' as _i709;
import '../src/common/services/rclone.dart' as _i867;
import '../src/home/services/local.dart' as _i930;
import '../src/home/services/providers/google_drive.dart' as _i712;
import '../src/home/services/rclone.dart' as _i303;
import '../src/introduction/services/intro_service.dart' as _i808;
import 'registration.dart' as _i544;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i360.GoogleAuthService>(() => _i360.GoogleAuthService());
    gh.singleton<_i709.RCloneAuthService>(() => _i709.RCloneAuthService());
    gh.singleton<_i867.RCloneUtils>(() => _i867.RCloneUtils());
    gh.singleton<_i712.GoogleDriveService>(() => _i712.GoogleDriveService());
    gh.singleton<_i303.RCloneDriveService>(() => _i303.RCloneDriveService());
    gh.singleton<_i303.RCloneSyncService>(() => _i303.RCloneSyncService());
    gh.singleton<_i930.LocalDriveService>(() => _i930.LocalDriveService());
    gh.singleton<_i808.IntroService>(() => _i808.IntroService());
    return this;
  }
}

class _$RegisterModule extends _i544.RegisterModule {}
