import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../entity/item.dart';
import '../../repository/cart_repository.dart';
import '../base_use_case.dart';

class AddItemUseCase implements BaseUseCase<Item, int> {
  final CartRepository _cartRepository;

  AddItemUseCase(this._cartRepository);

  @override
  Future<Either<Failure, int>> execute(input) async {
    return await _cartRepository.addNewItem(input!);
  }
}
