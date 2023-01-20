import 'package:hnflutter_challenge/data/model/product_model.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';
import 'package:hnflutter_challenge/domain/entity/user.dart';
import 'package:hnflutter_challenge/utils/constants/constants.dart';
import 'package:hnflutter_challenge/utils/mapper/extensions.dart';

import '../../data/model/auth_model.dart';
import '../../data/model/bakery_model.dart';

extension UserDataMapper on UserData? {
  User toDomain() {
    return User(
      this?.userId.orEmpty() ?? empty,
      this?.email.orEmpty() ?? empty,
      this?.name.orEmpty() ?? empty,
    );
  }
}

extension ProductMapper on ProductResponse?{
  Product toDomain() {
    return Product(id: this?.id,
        name: this?.name,
        ingredients: this?.ingredients,
        type: this?.type,
        image: this?.image);
  }
}

extension BakeryMapper on BakeryResponse?{
  Bakery toDomain() {
    return Bakery(id: this?.id,
        name: this?.name,
        lat: this?.lat,
        lon: this?.lon,
        rate: this?.rate,
        type: this?.type,
        logo: this?.logo,);
  }
}
