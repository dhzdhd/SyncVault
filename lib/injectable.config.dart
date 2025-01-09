// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'src/accounts/services/rclone.dart' as _i774;
import 'src/common/services/rclone.dart' as _i1068;
import 'src/home/services/rclone.dart' as _i379;
import 'src/introduction/services/intro_service.dart' as _i748;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i379.RCloneDriveService>(() => _i379.RCloneDriveService());
    gh.singleton<_i748.IntroService>(() => _i748.IntroService());
    gh.singleton<_i774.RCloneAuthService>(() => _i774.RCloneAuthService());
    gh.singleton<_i1068.RCloneUtils>(() => _i1068.RCloneUtils());
    return this;
  }
}
