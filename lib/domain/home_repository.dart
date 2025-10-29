import 'package:dartz/dartz.dart';
import 'package:mytravaly/data/model/property_list_model.dart';

import '../core/failure.dart';
import '../data/model/searched_property_list_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Property>>> fetchHomeData();

  Future<Either<Failure, List<ArrayOfHotelList>>> fetchSearchResults({required String query});
}
