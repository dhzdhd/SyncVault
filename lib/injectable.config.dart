// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'src/accounts/services/auth/dropbox.dart' as _i797;
import 'src/accounts/services/auth/gdrive.dart' as _i432;
import 'src/accounts/services/auth/onedrive.dart' as _i725;
import 'src/accounts/services/drive/dropbox.dart' as _i464;
import 'src/accounts/services/drive/gdrive.dart' as _i487;
import 'src/accounts/services/drive/onedrive.dart' as _i660;
import 'src/home/services/rclone.dart' as _i379;

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
    gh.singleton<_i797.DropBoxAuth>(() => _i797.DropBoxAuth());
    gh.singleton<_i432.GoogleDriveAuth>(() => _i432.GoogleDriveAuth());
    gh.singleton<_i725.OneDriveAuth>(() => _i725.OneDriveAuth());
    gh.singleton<_i464.DropBox>(() => _i464.DropBox());
    gh.singleton<_i487.GoogleDrive>(() => _i487.GoogleDrive());
    gh.singleton<_i660.OneDrive>(() => _i660.OneDrive());
    gh.singleton<_i379.RCloneUtils>(() => _i379.RCloneUtils());
    gh.singleton<_i379.RCloneAuthService>(() => _i379.RCloneAuthService());
    gh.singleton<_i379.RCloneDriveService>(() => _i379.RCloneDriveService());
    return this;
  }
}
