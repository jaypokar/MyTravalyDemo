/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

SearchedPropertyListModel searchedPropertyListModelFromJson(String str) => SearchedPropertyListModel.fromJson(json.decode(str));

String searchedPropertyListModelToJson(SearchedPropertyListModel data) => json.encode(data.toJson());

class SearchedPropertyListModel {
    SearchedPropertyListModel({
        required this.data,
        required this.message,
        required this.status,
        required this.responseCode,
    });

    SearchedPropertyListModelData data;
    String message;
    bool status;
    int responseCode;

    factory SearchedPropertyListModel.fromJson(Map<dynamic, dynamic> json) => SearchedPropertyListModel(
        data: SearchedPropertyListModelData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
        responseCode: json["responseCode"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
        "responseCode": responseCode,
    };
}






class SearchedPropertyListModelData {
    SearchedPropertyListModelData({
        required this.arrayOfExcludedHotels,
        required this.arrayOfExcludedSearchType,
        required this.arrayOfHotelList,
    });

    List<String> arrayOfExcludedHotels;
    List<String> arrayOfExcludedSearchType;
    List<ArrayOfHotelList> arrayOfHotelList;

    factory SearchedPropertyListModelData.fromJson(Map<dynamic, dynamic> json) => SearchedPropertyListModelData(
        arrayOfExcludedHotels: List<String>.from(json["arrayOfExcludedHotels"].map((x) => x)),
        arrayOfExcludedSearchType: List<String>.from(json["arrayOfExcludedSearchType"].map((x) => x)),
        arrayOfHotelList: List<ArrayOfHotelList>.from(json["arrayOfHotelList"].map((x) => ArrayOfHotelList.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "arrayOfExcludedHotels": List<dynamic>.from(arrayOfExcludedHotels.map((x) => x)),
        "arrayOfExcludedSearchType": List<dynamic>.from(arrayOfExcludedSearchType.map((x) => x)),
        "arrayOfHotelList": List<dynamic>.from(arrayOfHotelList.map((x) => x.toJson())),
    };
}

class ArrayOfHotelList {
    ArrayOfHotelList({
        required this.propertyImage,
        required this.propertyView,
        required this.propertyAddress,
        required this.propertyMinPrice,
        required this.propertytype,
        required this.propertyPoliciesAndAmmenities,
        required this.roomName,
        required this.availableDeals,
        required this.propertyMaxPrice,
        required this.propertyUrl,
        required this.simplPriceList,
        required this.propertyCode,
        required this.propertyName,
        required this.numberOfAdults,
        required this.subscriptionStatus,
        required this.googleReview,
        required this.markedPrice,
        required this.propertyStar,
        required this.isFavorite,
    });

    PropertyImage propertyImage;
    int propertyView;
    PropertyAddress propertyAddress;
    Price propertyMinPrice;
    String propertytype;
    PropertyPoliciesAndAmmenities propertyPoliciesAndAmmenities;
    String roomName;
    List<AvailableDeal> availableDeals;
    Price propertyMaxPrice;
    String propertyUrl;
    SimplPriceList simplPriceList;
    String propertyCode;
    String propertyName;
    int numberOfAdults;
    SubscriptionStatus subscriptionStatus;
    GoogleReview googleReview;
    Price markedPrice;
    int propertyStar;
    bool isFavorite;

    factory ArrayOfHotelList.fromJson(Map<dynamic, dynamic> json) => ArrayOfHotelList(
        propertyImage: PropertyImage.fromJson(json["propertyImage"]),
        propertyView: json["propertyView"],
        propertyAddress: PropertyAddress.fromJson(json["propertyAddress"]),
        propertyMinPrice: Price.fromJson(json["propertyMinPrice"]),
        propertytype: json["propertytype"],
        propertyPoliciesAndAmmenities: PropertyPoliciesAndAmmenities.fromJson(json["propertyPoliciesAndAmmenities"]),
        roomName: json["roomName"],
        availableDeals: List<AvailableDeal>.from(json["availableDeals"].map((x) => AvailableDeal.fromJson(x))),
        propertyMaxPrice: Price.fromJson(json["propertyMaxPrice"]),
        propertyUrl: json["propertyUrl"],
        simplPriceList: SimplPriceList.fromJson(json["simplPriceList"]),
        propertyCode: json["propertyCode"],
        propertyName: json["propertyName"],
        numberOfAdults: json["numberOfAdults"],
        subscriptionStatus: SubscriptionStatus.fromJson(json["subscriptionStatus"]),
        googleReview: GoogleReview.fromJson(json["googleReview"]),
        markedPrice: Price.fromJson(json["markedPrice"]),
        propertyStar: json["propertyStar"],
        isFavorite: json["isFavorite"],
    );

    Map<dynamic, dynamic> toJson() => {
        "propertyImage": propertyImage.toJson(),
        "propertyView": propertyView,
        "propertyAddress": propertyAddress.toJson(),
        "propertyMinPrice": propertyMinPrice.toJson(),
        "propertytype": propertytype,
        "propertyPoliciesAndAmmenities": propertyPoliciesAndAmmenities.toJson(),
        "roomName": roomName,
        "availableDeals": List<dynamic>.from(availableDeals.map((x) => x.toJson())),
        "propertyMaxPrice": propertyMaxPrice.toJson(),
        "propertyUrl": propertyUrl,
        "simplPriceList": simplPriceList.toJson(),
        "propertyCode": propertyCode,
        "propertyName": propertyName,
        "numberOfAdults": numberOfAdults,
        "subscriptionStatus": subscriptionStatus.toJson(),
        "googleReview": googleReview.toJson(),
        "markedPrice": markedPrice.toJson(),
        "propertyStar": propertyStar,
        "isFavorite": isFavorite,
    };
}

class AvailableDeal {
    AvailableDeal({
        required this.headerName,
        required this.websiteUrl,
        required this.price,
        required this.dealType,
    });

    String headerName;
    String websiteUrl;
    Price price;
    String dealType;

    factory AvailableDeal.fromJson(Map<dynamic, dynamic> json) => AvailableDeal(
        headerName: json["headerName"],
        websiteUrl: json["websiteUrl"],
        price: Price.fromJson(json["price"]),
        dealType: json["dealType"],
    );

    Map<dynamic, dynamic> toJson() => {
        "headerName": headerName,
        "websiteUrl": websiteUrl,
        "price": price.toJson(),
        "dealType": dealType,
    };
}

class Price {
    Price({
        required this.displayAmount,
        required this.amount,
        required this.currencyAmount,
        required this.currencySymbol,
    });

    String displayAmount;
    double amount;
    String currencyAmount;
    CurrencySymbol currencySymbol;

    factory Price.fromJson(Map<dynamic, dynamic> json) => Price(
        displayAmount: json["displayAmount"],
        amount: json["amount"]?.toDouble(),
        currencyAmount: json["currencyAmount"],
        currencySymbol: currencySymbolValues.map[json["currencySymbol"]]!,
    );

    Map<dynamic, dynamic> toJson() => {
        "displayAmount": displayAmount,
        "amount": amount,
        "currencyAmount": currencyAmount,
        "currencySymbol": currencySymbolValues.reverse[currencySymbol],
    };
}

enum CurrencySymbol { EMPTY }

final currencySymbolValues = EnumValues({
    "₹": CurrencySymbol.EMPTY
});

class GoogleReview {
    GoogleReview({
        required this.data,
        required this.reviewPresent,
    });

    GoogleReviewData data;
    bool reviewPresent;

    factory GoogleReview.fromJson(Map<dynamic, dynamic> json) => GoogleReview(
        data: GoogleReviewData.fromJson(json["data"]),
        reviewPresent: json["reviewPresent"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": data.toJson(),
        "reviewPresent": reviewPresent,
    };
}

class GoogleReviewData {
    GoogleReviewData({
        required this.overallRating,
        required this.withoutDecimal,
        required this.totalUserRating,
    });

    double overallRating;
    int withoutDecimal;
    int totalUserRating;

    factory GoogleReviewData.fromJson(Map<dynamic, dynamic> json) => GoogleReviewData(
        overallRating: json["overallRating"]?.toDouble(),
        withoutDecimal: json["withoutDecimal"],
        totalUserRating: json["totalUserRating"],
    );

    Map<dynamic, dynamic> toJson() => {
        "overallRating": overallRating,
        "withoutDecimal": withoutDecimal,
        "totalUserRating": totalUserRating,
    };
}

class PropertyAddress {
    PropertyAddress({
        required this.zipcode,
        required this.country,
        required this.city,
        required this.street,
        required this.latitude,
        required this.state,
        required this.mapAddress,
        required this.longitude,
    });

    String zipcode;
    String country;
    String city;
    String street;
    double latitude;
    String state;
    String mapAddress;
    double longitude;

    factory PropertyAddress.fromJson(Map<dynamic, dynamic> json) => PropertyAddress(
        zipcode: json["zipcode"],
        country: json["country"],
        city: json["city"],
        street: json["street"],
        latitude: json["latitude"]?.toDouble(),
        state: json["state"],
        mapAddress: json["mapAddress"],
        longitude: json["longitude"]?.toDouble(),
    );

    Map<dynamic, dynamic> toJson() => {
        "zipcode": zipcode,
        "country": country,
        "city": city,
        "street": street,
        "latitude": latitude,
        "state": state,
        "mapAddress": mapAddress,
        "longitude": longitude,
    };
}

class PropertyImage {
    PropertyImage({
        required this.imageName,
        required this.fullUrl,
        required this.location,
    });

    String imageName;
    String fullUrl;
    String location;

    factory PropertyImage.fromJson(Map<dynamic, dynamic> json) => PropertyImage(
        imageName: json["imageName"],
        fullUrl: json["fullUrl"],
        location: json["location"],
    );

    Map<dynamic, dynamic> toJson() => {
        "imageName": imageName,
        "fullUrl": fullUrl,
        "location": location,
    };
}

class PropertyPoliciesAndAmmenities {
    PropertyPoliciesAndAmmenities({
        required this.data,
        required this.present,
    });

    PropertyPoliciesAndAmmenitiesData data;
    bool present;

    factory PropertyPoliciesAndAmmenities.fromJson(Map<dynamic, dynamic> json) => PropertyPoliciesAndAmmenities(
        data: PropertyPoliciesAndAmmenitiesData.fromJson(json["data"]),
        present: json["present"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": data.toJson(),
        "present": present,
    };
}

class PropertyPoliciesAndAmmenitiesData {
    PropertyPoliciesAndAmmenitiesData({
        required this.suitableForChildren,
        required this.damagePolicy,
        required this.bachularsAllowed,
        required this.petsAllowed,
        required this.payNow,
        required this.cancelPolicy,
        required this.refundPolicy,
        required this.freeCancellation,
        required this.freeWifi,
        required this.propertyRestriction,
        required this.payAtHotel,
        required this.childPolicy,
        required this.lastUpdatedOn,
        required this.coupleFriendly,
    });

    bool suitableForChildren;
    String damagePolicy;
    bool bachularsAllowed;
    bool petsAllowed;
    bool payNow;
    String cancelPolicy;
    String refundPolicy;
    bool freeCancellation;
    bool freeWifi;
    String propertyRestriction;
    bool payAtHotel;
    String childPolicy;
    DateTime lastUpdatedOn;
    bool coupleFriendly;

    factory PropertyPoliciesAndAmmenitiesData.fromJson(Map<dynamic, dynamic> json) => PropertyPoliciesAndAmmenitiesData(
        suitableForChildren: json["suitableForChildren"],
        damagePolicy: json["damagePolicy"],
        bachularsAllowed: json["bachularsAllowed"],
        petsAllowed: json["petsAllowed"],
        payNow: json["payNow"],
        cancelPolicy: json["cancelPolicy"],
        refundPolicy: json["refundPolicy"],
        freeCancellation: json["freeCancellation"],
        freeWifi: json["freeWifi"],
        propertyRestriction: json["propertyRestriction"],
        payAtHotel: json["payAtHotel"],
        childPolicy: json["childPolicy"],
        lastUpdatedOn: DateTime.parse(json["lastUpdatedOn"]),
        coupleFriendly: json["coupleFriendly"],
    );

    Map<dynamic, dynamic> toJson() => {
        "suitableForChildren": suitableForChildren,
        "damagePolicy": damagePolicy,
        "bachularsAllowed": bachularsAllowed,
        "petsAllowed": petsAllowed,
        "payNow": payNow,
        "cancelPolicy": cancelPolicy,
        "refundPolicy": refundPolicy,
        "freeCancellation": freeCancellation,
        "freeWifi": freeWifi,
        "propertyRestriction": propertyRestriction,
        "payAtHotel": payAtHotel,
        "childPolicy": childPolicy,
        "lastUpdatedOn": lastUpdatedOn.toIso8601String(),
        "coupleFriendly": coupleFriendly,
    };
}

class SimplPriceList {
    SimplPriceList({
        required this.originalPrice,
        required this.simplPrice,
    });

    int originalPrice;
    Price simplPrice;

    factory SimplPriceList.fromJson(Map<dynamic, dynamic> json) => SimplPriceList(
        originalPrice: json["originalPrice"],
        simplPrice: Price.fromJson(json["simplPrice"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "originalPrice": originalPrice,
        "simplPrice": simplPrice.toJson(),
    };
}

class SubscriptionStatus {
    SubscriptionStatus({
        required this.status,
    });

    bool status;

    factory SubscriptionStatus.fromJson(Map<dynamic, dynamic> json) => SubscriptionStatus(
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "status": status,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
