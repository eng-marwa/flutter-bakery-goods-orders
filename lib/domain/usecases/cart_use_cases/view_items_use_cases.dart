import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hnflutter_challenge/domain/entity/item.dart';

import '../../../app/failure.dart';
import '../../repository/cart_repository.dart';
import '../base_use_case.dart';

class ViewAllItemsUseCase implements BaseUseCase<void, ValueListenable<Box<Item>>> {
  final CartRepository _cartRepository;

  ViewAllItemsUseCase(this._cartRepository);

  @override
  Future<Either<Failure, ValueListenable<Box<Item>>>> execute(input) async {
    return await _cartRepository.viewAllItems();
  }
}
