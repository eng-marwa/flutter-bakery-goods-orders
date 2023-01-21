import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';
import 'package:hnflutter_challenge/domain/repository/user_action_repository.dart';

import '../../../app/failure.dart';
import '../base_use_case.dart';

class ViewBakeriesListUseCase implements BaseUseCase<void, List<Bakery>> {
  final UserActionsRepository _userActionsRepository;

  ViewBakeriesListUseCase(this._userActionsRepository);

  @override
  Future<Either<Failure, List<Bakery>>> execute(input) async {
    return await _userActionsRepository.viewListOfBakeries();
  }
}
