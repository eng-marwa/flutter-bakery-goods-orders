import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app/failure.dart';
import '../../domain/entity/item.dart';

abstract class BasCartLocalRepository {
  //use hive
  BasCartLocalRepository();

  Either<Failure, int> addNewItem(Item item);

  Either<Failure, int> removeExistingItem(int itemId);

  Either<Failure, ValueListenable<Box<Item>>> viewAllItems();

  Either<Failure, int> removeAllItems();

  Either<Failure, bool> getItem(int itemId);
}

class BasCartLocalRepositoryImp extends BasCartLocalRepository {
  Box<Item> _box;

  BasCartLocalRepositoryImp(this._box);

  @override
  Either<Failure, int> addNewItem(Item item)  {
    try {
       _box.put(item.productId!, item);
      return Right(1);
    } on HiveError catch (e) {
      return Left(Failure(code: 422, message: e.message));
    }
  }

  @override
  Either<Failure, int> removeAllItems()  {
    try {
       _box.deleteFromDisk();
      return Right(1);
    } on HiveError catch (e) {
      return Left(Failure(code: 422, message: e.message));
    }
  }

  @override
  Either<Failure, int> removeExistingItem(int itemId)  {
    try {
       _box.delete(itemId);
      return Right(1);
    } on HiveError catch (e) {
      return Left(Failure(code: 422, message: e.message));
    }
  }

  @override
  Either<Failure, ValueListenable<Box<Item>>> viewAllItems() {
    try {
      ValueListenable<Box<Item>> listenable = _box.listenable();
      return Right(listenable);
    } on HiveError catch (e) {
      return Left(Failure(code: 422, message: e.message));
    }
  }

  @override
  Either<Failure, bool> getItem(int itemId) {
    try {
      Item? item = _box.get(itemId);
      if (item != null) {
        return Right(true);
      } else {
        return Right(false);
      }
    } on HiveError catch (e) {
      return Left(Failure(code: 422, message: e.message));
    }
  }
}
