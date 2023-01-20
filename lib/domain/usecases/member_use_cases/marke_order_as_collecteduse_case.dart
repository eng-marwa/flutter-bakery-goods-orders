import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../repository/member_action_repository.dart';
import '../base_use_case.dart';
class MarkAsCollectedUseCase implements BaseUseCase<int, void> {
  final MemberActionsRepository _memberActionsRepository;

  MarkAsCollectedUseCase(this._memberActionsRepository);

  @override
  Future<Either<Failure, void>> execute(input) async {
    return await _memberActionsRepository.markedAsCollected(input!);
  }
}