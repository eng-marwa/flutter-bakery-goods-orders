import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../entity/Bakery.dart';
import '../../repository/user_action_repository.dart';
import '../base_use_case.dart';

class FilterByProximityUseCase implements BaseUseCase<void, List<Bakery>> {
  final UserActionsRepository _userActionsRepository;

  FilterByProximityUseCase(this._userActionsRepository);

  @override
  Future<Either<Failure, List<Bakery>>> execute(input) async {
    return await _userActionsRepository.filterByProximity();
  }
}
