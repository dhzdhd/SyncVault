// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'src/accounts/services/auth/dropbox.dart' as _i3;
import 'src/accounts/services/auth/gdrive.dart' as _i4;
import 'src/accounts/services/auth/onedrive.dart' as _i5;
import 'src/accounts/services/drive/dropbox.dart' as _i6;
import 'src/accounts/services/drive/gdrive.dart' as _i7;
import 'src/accounts/services/drive/onedrive.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DropBoxAuth>(() => _i3.DropBoxAuth());
    gh.singleton<_i4.GoogleDriveAuth>(() => _i4.GoogleDriveAuth());
    gh.singleton<_i5.OneDriveAuth>(() => _i5.OneDriveAuth());
    gh.singleton<_i6.DropBox>(() => _i6.DropBox());
    gh.singleton<_i7.GoogleDrive>(() => _i7.GoogleDrive());
    gh.singleton<_i8.OneDrive>(() => _i8.OneDrive());
    return this;
  }
}
