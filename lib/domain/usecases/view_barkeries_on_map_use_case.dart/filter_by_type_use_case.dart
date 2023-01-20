import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../entity/Bakery.dart';
import '../../repository/user_action_repository.dart';
import '../base_use_case.dart';

class FilterByTypeUseCase implements BaseUseCase<String, List<Bakery>> {
  final UserActionsRepository _userActionsRepository;

  FilterByTypeUseCase(this._userActionsRepository);

  @override
  Future<Either<Failure, List<Bakery>>> execute(input) async {
    return await _userActionsRepository.filterByType(input!);
  }
}
