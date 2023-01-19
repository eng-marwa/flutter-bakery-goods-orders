import 'package:hnflutter_challenge/data/model/Bakery.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';
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

extension BakeryMapper on BakeryResponse?{
  Product toDomain() {
    return Product(id: this?.id,
        name: this?.name,
        ingredients: this?.ingredients,
        steps: this?.steps,
        servings: this?.servings,
        image: this?.image);
  }
}
