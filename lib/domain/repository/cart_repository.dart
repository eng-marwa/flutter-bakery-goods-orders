import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hnflutter_challenge/domain/entity/item.dart';

import '../../app/failure.dart';
import '../../data/repository/cart_local_repository.dart';

abstract class CartRepository {
  BasCartLocalRepository _baseCartLocalRepository;

  CartRepository(this._baseCartLocalRepository);

  Either<Failure, int> addNewItem(Item item);

  Either<Failure, int> removeExistingItem(int itemId);

  Either<Failure, ValueListenable<Box<Item>>> viewAllItems();

  Either<Failure, int> removeAllItems();

  Either<Failure, bool> getItem(int itemId);

}

class CartRepositoryImp extends CartRepository {
  CartRepositoryImp(super._baseCartLocalRepository);

  @override
  Either<Failure, int> addNewItem(Item item) {
    return _baseCartLocalRepository.addNewItem(item);
  }

  @override
  Either<Failure, int> removeAllItems() {
    return _baseCartLocalRepository.removeAllItems();
  }

  @override
  Either<Failure, int> removeExistingItem(int itemId) {
    return _baseCartLocalRepository.removeExistingItem(itemId);
  }

  @override
  Either<Failure, ValueListenable<Box<Item>>> viewAllItems() {
    return _baseCartLocalRepository.viewAllItems();
  }

  @override
  Either<Failure, bool> getItem(int itemId) {
    return _baseCartLocalRepository.getItem(itemId);
  }
}
