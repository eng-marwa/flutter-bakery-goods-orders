import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';

import '../../../app/failure.dart';
import '../../repository/user_action_repository.dart';
import '../base_use_case.dart';

class ViewProductsUseCase implements BaseUseCase<int, List<Product>> {
  final UserActionsRepository _userActionsRepository;

  ViewProductsUseCase(this._userActionsRepository);

  @override
  Future<Either<Failure, List<Product>>> execute(input) async {
    return await _userActionsRepository.viewListOfProduct(input!);
  }
}
