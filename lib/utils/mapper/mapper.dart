import 'package:hnflutter_challenge/domain/entity/user.dart';
import 'package:hnflutter_challenge/utils/constants/constants.dart';
import 'package:hnflutter_challenge/utils/mapper/extensions.dart';

import '../../data/model/auth.dart';

extension UserDataMapper on UserData? {
  User toDomain() {
    return User(
      this?.userId.orEmpty() ?? empty,
      this?.email.orEmpty() ?? empty,
      this?.name.orEmpty() ?? empty,
    );
  }
}
