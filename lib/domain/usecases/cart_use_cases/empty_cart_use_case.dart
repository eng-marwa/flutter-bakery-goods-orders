import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../repository/cart_repository.dart';
import '../base_use_case.dart';

class RemoveAllItemsUseCase implements BaseUseCase<void, int> {
  final CartRepository _cartRepository;

  RemoveAllItemsUseCase(this._cartRepository);

  @override
  Future<Either<Failure, int>> execute(input) async {
    return await _cartRepository.removeAllItems();
  }
}
