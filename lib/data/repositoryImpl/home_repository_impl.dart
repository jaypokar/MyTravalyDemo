import 'package:dartz/dartz.dart';
import 'package:mytravaly/core/either_extension_function.dart';
import 'package:mytravaly/data/model/property_list_model.dart';
import 'package:mytravaly/data/model/searched_property_list_model.dart';

import '../../core/app_type_def.dart';
import '../../core/failure.dart';
import '../../core/update_ui_mixin.dart';
import '../../domain/home_repository.dart';
import '../../resources/config_file.dart';
import '../apiService/base_api_service.dart';
import '../apiService/network_api_service.dart';

class HomeRepositoryImpl with UpdateUiMixin implements HomeRepository {
  final BaseAPIService _baseAPIService;

  HomeRepositoryImpl(this._baseAPIService);

  @override
  Future<Either<Failure, List<Property>>> fetchHomeData() async {
    ///NOTE : there is no option for sending page no to implement pagination in your APIS so
    ///i am just calling the api to get the results and show it into the UI

    return backToUI<List<Property>>(
      () => _baseAPIService.executeAPI(
        url: ConfigFile.fetchPropertyList,
        queryParameters: {
          "action": "popularStay",
          "popularStay": {
            "limit": 10, //maximum 10
            "entityType": "Any", //hotel, resort, Home Stay, Camp_sites/tent, Any
            "filter": {
              "searchType": "byCity", //byCity, byState, byCountry, byRandom,
              "searchTypeInfo": {"country": "India", "state": "Jharkhand", "city": "Jamshedpur"}
            },
            "currency": "INR"
          }
        },
        apiType: ApiType.POST,
      ),
    );
  }

  @override
  Future<Either<Failure, List<ArrayOfHotelList>>> fetchSearchResults({required String query}) {
    ///NOTE : there is no option for sending page no to implement pagination in your APIS so
    ///i am just calling the api to get the results and show it into the UI

    /// well i was sending the query string in the req but it was showing no results so i will keep the
    /// same query

    return backToUI<List<ArrayOfHotelList>>(
      () => _baseAPIService.executeAPI(
        url: ConfigFile.fetchPropertyList,
        queryParameters: {
          "action": "getSearchResultListOfHotels",
          "getSearchResultListOfHotels": {
            "searchCriteria": {
              "checkIn": "2026-07-11",
              "checkOut": "2026-07-12",
              "rooms": 2,
              "adults": 2,
              "children": 0,
              "searchType": "hotelIdSearch",
              "searchQuery": ["qyhZqzVt"],
              "accommodation": [
                "all",
                "hotel"
                //allowed "hotel","resort","Boat House","bedAndBreakfast","guestHouse","Holidayhome","cottage","apartment","Home Stay", "hostel","Guest House","Camp_sites/tent","co_living","Villa","Motel","Capsule Hotel","Dome Hotel","all"
              ],
              "arrayOfExcludedSearchType": [
                "street" //allowed street, city, state, country
              ],
              "highPrice": "3000000",
              "lowPrice": "0",
              "limit": 5,
              "preloaderList": [],
              "currency": "INR",
              "rid": 0
            }
          }
        },
        apiType: ApiType.POST,
      ),
    );
  }

  @override
  Future<Either<Failure, T>> backToUI<T>(ManageAPIResponse manageAPIResponse, {String flag = ''}) async {
    final Either<Failure, dynamic> possibleData = await manageAPIResponse();

    if (possibleData.isLeft()) {
      if (possibleData.getLeft()!.statusCode == 404) {
        _baseAPIService.initiateLogoutProcess();
      }
      return left(
        Failure(possibleData.getLeft()!.error, statusCode: possibleData.getLeft()!.statusCode),
      );
    }
    final response = possibleData.getRight();
    late final T data;
    if (T == List<Property>) {
      final details = PropertyListModel.fromJson(response);
      data = (details.data ?? []) as T;
    } else if (T == List<ArrayOfHotelList>) {
      final details = SearchedPropertyListModel.fromJson(response);
      data = (details.data.arrayOfHotelList ?? []) as T;
    }
    return right(data);
  }
}
