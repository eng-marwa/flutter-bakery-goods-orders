import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';
import 'package:hnflutter_challenge/domain/repository/bakery_repository.dart';

import '../../app/failure.dart';
import 'base_use_case.dart';

class AllBakeryUseCase implements BaseUseCase<void, Product> {
  final BakeryRepository _bakeryRepository;

  AllBakeryUseCase(this._bakeryRepository);

  @override
  Future<Either<Failure, Product>> execute(input) async{
    return await _bakeryRepository.all();
  }
}