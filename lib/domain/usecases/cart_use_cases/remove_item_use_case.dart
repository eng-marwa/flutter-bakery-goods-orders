import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../repository/cart_repository.dart';
import '../base_use_case.dart';

class RemoveItemUseCase implements BaseUseCase<int, int> {
  final CartRepository _cartRepository;

  RemoveItemUseCase(this._cartRepository);

  @override
  Future<Either<Failure, int>> execute(input) async {
    return await _cartRepository.removeExistingItem(input!);
  }
}
