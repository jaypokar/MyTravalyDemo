/// status : true
/// message : "Details fetched successfully."
/// responseCode : 200
/// data : [{"propertyName":"Hotel Holideiinn","propertyStar":4,"propertyImage":"https://dwq3yv87q1b43.cloudfront.net/public/property/property_images/fit-in/600x600/725350030-2072256155.jpg","propertyCode":"PgVcKFPF","propertyType":"hotel","propertyPoliciesAndAmmenities":{"present":true,"data":{"cancelPolicy":"7days before  check in no cancellations will applicable.","refundPolicy":"If cancel 72Hrs before check in 20% booking refunded.","childPolicy":"Above than 5 years payment will applicable.","damagePolicy":"Property damages applicable.","propertyRestriction":"Pets are not allowed. Minimum check in year 18+.","petsAllowed":false,"coupleFriendly":true,"suitableForChildren":true,"bachularsAllowed":true,"freeWifi":true,"freeCancellation":true,"payAtHotel":false,"payNow":true,"lastUpdatedOn":"2023-06-05 16:03:33"}},"markedPrice":{"amount":1673.49,"displayAmount":"₹1,673.49","currencyAmount":"1,673.49","currencySymbol":"₹"},"staticPrice":{"amount":1389,"displayAmount":"₹1,389","currencyAmount":"1,389","currencySymbol":"₹"},"googleReview":{"reviewPresent":true,"data":{"overallRating":3.8,"totalUserRating":1139,"withoutDecimal":4}},"propertyUrl":"https://mytravaly.com/hotels/hotel-details/?hotelid=PgVcKFPF","propertyAddress":{"street":"Sakchi , Straight Mile Road, Near Ramlila Maidan Plote No .523, Straight Mile Rd, Sakchi, Jamshedpur, Jharkhand 831001","city":"Jamshedpur","state":"Jharkhand","country":"India","zipcode":"831001","map_address":"Hotel Holideiinn","latitude":22.8049718,"longitude":86.2073332}},{"propertyName":"Hotel B S Park Plaza, Jamshedpur","propertyStar":3,"propertyImage":"https://dwq3yv87q1b43.cloudfront.net/public/property/property_images/fit-in/600x600/1171844694-1401210705.jpg","propertyCode":"KMyxSvMw","propertyType":"hotel","propertyPoliciesAndAmmenities":{"present":true,"data":{"cancelPolicy":"NA","refundPolicy":"NA","childPolicy":"NA","damagePolicy":"Guests will be directly charged for any damages to hotel properties during their stay.","propertyRestriction":"1.The primary guest must be at least 18 years of age to check into this hotel. 2. Any activities violating the law are strictly prohibited.","petsAllowed":false,"coupleFriendly":false,"suitableForChildren":false,"bachularsAllowed":true,"freeWifi":true,"freeCancellation":true,"payAtHotel":false,"payNow":true,"lastUpdatedOn":"2024-09-24 11:18:05"}},"markedPrice":{"amount":3012.05,"displayAmount":"₹3,012.05","currencyAmount":"3,012.05","currencySymbol":"₹"},"staticPrice":{"amount":2500,"displayAmount":"₹2,500","currencyAmount":"2,500","currencySymbol":"₹"},"googleReview":{"reviewPresent":true,"data":{"overallRating":3.8,"totalUserRating":497,"withoutDecimal":4}},"propertyUrl":"https://mytravaly.com/hotels/hotel-details/?hotelid=KMyxSvMw","propertyAddress":{"street":"SB Shop Area, Main Road, Bistupur","city":"Jamshedpur","state":"Jharkhand","country":"India","zipcode":"831001","map_address":"NA","latitude":22.7902448,"longitude":86.1839336}},{"propertyName":"River Sidde Inn","propertyStar":3,"propertyImage":"https://dwq3yv87q1b43.cloudfront.net/public/property/property_images/fit-in/600x600/1960906822-39578.jpg","propertyCode":"rUNrbZoE","propertyType":"hotel","propertyPoliciesAndAmmenities":{"present":true,"data":{"cancelPolicy":"Free Cancelation.","refundPolicy":"Full Refund.","childPolicy":"Child above 5 yrs will be charged extra.","damagePolicy":"Any damage to the hotel property will be charged.","propertyRestriction":"The primary guest needs to be of 18 yrs or above and should carry a valid ID proof.","petsAllowed":false,"coupleFriendly":false,"suitableForChildren":true,"bachularsAllowed":false,"freeWifi":true,"freeCancellation":true,"payAtHotel":false,"payNow":true,"lastUpdatedOn":"2025-01-11 16:25:03"}},"markedPrice":{"amount":2658.82,"displayAmount":"₹2,658.82","currencyAmount":"2,658.82","currencySymbol":"₹"},"staticPrice":{"amount":2260,"displayAmount":"₹2,260","currencyAmount":"2,260","currencySymbol":"₹"},"googleReview":{"reviewPresent":true,"data":{"overallRating":4.4,"totalUserRating":105,"withoutDecimal":4}},"propertyUrl":"https://mytravaly.com/hotels/hotel-details/?hotelid=rUNrbZoE","propertyAddress":{"street":"Chowk, Mango, Jamshedpur","city":"Jamshedpur","state":"Jharkhand","country":"India","zipcode":"831012","map_address":"Riversidde Inn A Boutique Hotel","latitude":22.820469,"longitude":86.212281}}]

class PropertyListModel {
  PropertyListModel({
    bool? status,
    String? message,
    num? responseCode,
    List<Property>? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  PropertyListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Property.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  num? _responseCode;
  List<Property>? _data;
  PropertyListModel copyWith({
    bool? status,
    String? message,
    num? responseCode,
    List<Property>? data,
  }) =>
      PropertyListModel(
        status: status ?? _status,
        message: message ?? _message,
        responseCode: responseCode ?? _responseCode,
        data: data ?? _data,
      );
  bool? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<Property>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['responseCode'] = _responseCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// propertyName : "Hotel Holideiinn"
/// propertyStar : 4
/// propertyImage : "https://dwq3yv87q1b43.cloudfront.net/public/property/property_images/fit-in/600x600/725350030-2072256155.jpg"
/// propertyCode : "PgVcKFPF"
/// propertyType : "hotel"
/// propertyPoliciesAndAmmenities : {"present":true,"data":{"cancelPolicy":"7days before  check in no cancellations will applicable.","refundPolicy":"If cancel 72Hrs before check in 20% booking refunded.","childPolicy":"Above than 5 years payment will applicable.","damagePolicy":"Property damages applicable.","propertyRestriction":"Pets are not allowed. Minimum check in year 18+.","petsAllowed":false,"coupleFriendly":true,"suitableForChildren":true,"bachularsAllowed":true,"freeWifi":true,"freeCancellation":true,"payAtHotel":false,"payNow":true,"lastUpdatedOn":"2023-06-05 16:03:33"}}
/// markedPrice : {"amount":1673.49,"displayAmount":"₹1,673.49","currencyAmount":"1,673.49","currencySymbol":"₹"}
/// staticPrice : {"amount":1389,"displayAmount":"₹1,389","currencyAmount":"1,389","currencySymbol":"₹"}
/// googleReview : {"reviewPresent":true,"data":{"overallRating":3.8,"totalUserRating":1139,"withoutDecimal":4}}
/// propertyUrl : "https://mytravaly.com/hotels/hotel-details/?hotelid=PgVcKFPF"
/// propertyAddress : {"street":"Sakchi , Straight Mile Road, Near Ramlila Maidan Plote No .523, Straight Mile Rd, Sakchi, Jamshedpur, Jharkhand 831001","city":"Jamshedpur","state":"Jharkhand","country":"India","zipcode":"831001","map_address":"Hotel Holideiinn","latitude":22.8049718,"longitude":86.2073332}

class Property {
  Property({
    String? propertyName,
    num? propertyStar,
    String? propertyImage,
    String? propertyCode,
    String? propertyType,
    PropertyPoliciesAndAmmenities? propertyPoliciesAndAmmenities,
    MarkedPrice? markedPrice,
    StaticPrice? staticPrice,
    GoogleReview? googleReview,
    String? propertyUrl,
    PropertyAddress? propertyAddress,
  }) {
    _propertyName = propertyName;
    _propertyStar = propertyStar;
    _propertyImage = propertyImage;
    _propertyCode = propertyCode;
    _propertyType = propertyType;

    _markedPrice = markedPrice;
    _staticPrice = staticPrice;
    _googleReview = googleReview;
    _propertyUrl = propertyUrl;
    _propertyAddress = propertyAddress;
  }

  Property.fromJson(dynamic json) {
    _propertyName = json['propertyName'];
    _propertyStar = json['propertyStar'];
    _propertyImage = json['propertyImage'];
    _propertyCode = json['propertyCode'];
    _propertyType = json['propertyType'];
    _markedPrice = json['markedPrice'] != null ? MarkedPrice.fromJson(json['markedPrice']) : null;
    _staticPrice = json['staticPrice'] != null ? StaticPrice.fromJson(json['staticPrice']) : null;
    _googleReview = json['googleReview'] != null ? GoogleReview.fromJson(json['googleReview']) : null;
    _propertyUrl = json['propertyUrl'];
    _propertyAddress =
        json['propertyAddress'] != null ? PropertyAddress.fromJson(json['propertyAddress']) : null;
  }
  String? _propertyName;
  num? _propertyStar;
  String? _propertyImage;
  String? _propertyCode;
  String? _propertyType;

  MarkedPrice? _markedPrice;
  StaticPrice? _staticPrice;
  GoogleReview? _googleReview;
  String? _propertyUrl;
  PropertyAddress? _propertyAddress;
  Property copyWith({
    String? propertyName,
    num? propertyStar,
    String? propertyImage,
    String? propertyCode,
    String? propertyType,
    PropertyPoliciesAndAmmenities? propertyPoliciesAndAmmenities,
    MarkedPrice? markedPrice,
    StaticPrice? staticPrice,
    GoogleReview? googleReview,
    String? propertyUrl,
    PropertyAddress? propertyAddress,
  }) =>
      Property(
        propertyName: propertyName ?? _propertyName,
        propertyStar: propertyStar ?? _propertyStar,
        propertyImage: propertyImage ?? _propertyImage,
        propertyCode: propertyCode ?? _propertyCode,
        propertyType: propertyType ?? _propertyType,
        markedPrice: markedPrice ?? _markedPrice,
        staticPrice: staticPrice ?? _staticPrice,
        googleReview: googleReview ?? _googleReview,
        propertyUrl: propertyUrl ?? _propertyUrl,
        propertyAddress: propertyAddress ?? _propertyAddress,
      );
  String? get propertyName => _propertyName;
  num? get propertyStar => _propertyStar;
  String? get propertyImage => _propertyImage;
  String? get propertyCode => _propertyCode;
  String? get propertyType => _propertyType;

  MarkedPrice? get markedPrice => _markedPrice;
  StaticPrice? get staticPrice => _staticPrice;
  GoogleReview? get googleReview => _googleReview;
  String? get propertyUrl => _propertyUrl;
  PropertyAddress? get propertyAddress => _propertyAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['propertyName'] = _propertyName;
    map['propertyStar'] = _propertyStar;
    map['propertyImage'] = _propertyImage;
    map['propertyCode'] = _propertyCode;
    map['propertyType'] = _propertyType;

    if (_markedPrice != null) {
      map['markedPrice'] = _markedPrice?.toJson();
    }
    if (_staticPrice != null) {
      map['staticPrice'] = _staticPrice?.toJson();
    }
    if (_googleReview != null) {
      map['googleReview'] = _googleReview?.toJson();
    }
    map['propertyUrl'] = _propertyUrl;
    if (_propertyAddress != null) {
      map['propertyAddress'] = _propertyAddress?.toJson();
    }
    return map;
  }
}

/// street : "Sakchi , Straight Mile Road, Near Ramlila Maidan Plote No .523, Straight Mile Rd, Sakchi, Jamshedpur, Jharkhand 831001"
/// city : "Jamshedpur"
/// state : "Jharkhand"
/// country : "India"
/// zipcode : "831001"
/// map_address : "Hotel Holideiinn"
/// latitude : 22.8049718
/// longitude : 86.2073332

class PropertyAddress {
  PropertyAddress({
    String? street,
    String? city,
    String? state,
    String? country,
    String? zipcode,
    String? mapAddress,
    num? latitude,
    num? longitude,
  }) {
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _zipcode = zipcode;
    _mapAddress = mapAddress;
    _latitude = latitude;
    _longitude = longitude;
  }

  PropertyAddress.fromJson(dynamic json) {
    _street = json['street'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _zipcode = json['zipcode'];
    _mapAddress = json['map_address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  String? _street;
  String? _city;
  String? _state;
  String? _country;
  String? _zipcode;
  String? _mapAddress;
  num? _latitude;
  num? _longitude;
  PropertyAddress copyWith({
    String? street,
    String? city,
    String? state,
    String? country,
    String? zipcode,
    String? mapAddress,
    num? latitude,
    num? longitude,
  }) =>
      PropertyAddress(
        street: street ?? _street,
        city: city ?? _city,
        state: state ?? _state,
        country: country ?? _country,
        zipcode: zipcode ?? _zipcode,
        mapAddress: mapAddress ?? _mapAddress,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
      );
  String? get street => _street;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get zipcode => _zipcode;
  String? get mapAddress => _mapAddress;
  num? get latitude => _latitude;
  num? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['zipcode'] = _zipcode;
    map['map_address'] = _mapAddress;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }
}

/// reviewPresent : true
/// data : {"overallRating":3.8,"totalUserRating":1139,"withoutDecimal":4}

class GoogleReview {
  GoogleReview({
    bool? reviewPresent,
    RatingData? data,
  }) {
    _reviewPresent = reviewPresent;
    _data = data;
  }

  GoogleReview.fromJson(dynamic json) {
    _reviewPresent = json['reviewPresent'];
    _data = json['data'] != null ? RatingData.fromJson(json['data']) : null;
  }
  bool? _reviewPresent;
  RatingData? _data;
  GoogleReview copyWith({
    bool? reviewPresent,
    RatingData? data,
  }) =>
      GoogleReview(
        reviewPresent: reviewPresent ?? _reviewPresent,
        data: data ?? _data,
      );
  bool? get reviewPresent => _reviewPresent;
  RatingData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reviewPresent'] = _reviewPresent;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// overallRating : 3.8
/// totalUserRating : 1139
/// withoutDecimal : 4

class RatingData {
  num? _overallRating;
  num? _totalUserRating;
  num? _withoutDecimal;

  RatingData.fromJson(dynamic json) {
    _overallRating = json['overallRating'];
    _totalUserRating = json['totalUserRating'];
    _withoutDecimal = json['withoutDecimal'];
  }

  num? get overallRating => _overallRating;
  num? get totalUserRating => _totalUserRating;
  num? get withoutDecimal => _withoutDecimal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overallRating'] = _overallRating;
    map['totalUserRating'] = _totalUserRating;
    map['withoutDecimal'] = _withoutDecimal;
    return map;
  }
}

/// amount : 1389
/// displayAmount : "₹1,389"
/// currencyAmount : "1,389"
/// currencySymbol : "₹"

class StaticPrice {
  StaticPrice({
    num? amount,
    String? displayAmount,
    String? currencyAmount,
    String? currencySymbol,
  }) {
    _amount = amount;
    _displayAmount = displayAmount;
    _currencyAmount = currencyAmount;
    _currencySymbol = currencySymbol;
  }

  StaticPrice.fromJson(dynamic json) {
    _amount = json['amount'];
    _displayAmount = json['displayAmount'];
    _currencyAmount = json['currencyAmount'];
    _currencySymbol = json['currencySymbol'];
  }
  num? _amount;
  String? _displayAmount;
  String? _currencyAmount;
  String? _currencySymbol;
  StaticPrice copyWith({
    num? amount,
    String? displayAmount,
    String? currencyAmount,
    String? currencySymbol,
  }) =>
      StaticPrice(
        amount: amount ?? _amount,
        displayAmount: displayAmount ?? _displayAmount,
        currencyAmount: currencyAmount ?? _currencyAmount,
        currencySymbol: currencySymbol ?? _currencySymbol,
      );
  num? get amount => _amount;
  String? get displayAmount => _displayAmount;
  String? get currencyAmount => _currencyAmount;
  String? get currencySymbol => _currencySymbol;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['displayAmount'] = _displayAmount;
    map['currencyAmount'] = _currencyAmount;
    map['currencySymbol'] = _currencySymbol;
    return map;
  }
}

/// amount : 1673.49
/// displayAmount : "₹1,673.49"
/// currencyAmount : "1,673.49"
/// currencySymbol : "₹"

class MarkedPrice {
  MarkedPrice({
    num? amount,
    String? displayAmount,
    String? currencyAmount,
    String? currencySymbol,
  }) {
    _amount = amount;
    _displayAmount = displayAmount;
    _currencyAmount = currencyAmount;
    _currencySymbol = currencySymbol;
  }

  MarkedPrice.fromJson(dynamic json) {
    _amount = json['amount'];
    _displayAmount = json['displayAmount'];
    _currencyAmount = json['currencyAmount'];
    _currencySymbol = json['currencySymbol'];
  }
  num? _amount;
  String? _displayAmount;
  String? _currencyAmount;
  String? _currencySymbol;
  MarkedPrice copyWith({
    num? amount,
    String? displayAmount,
    String? currencyAmount,
    String? currencySymbol,
  }) =>
      MarkedPrice(
        amount: amount ?? _amount,
        displayAmount: displayAmount ?? _displayAmount,
        currencyAmount: currencyAmount ?? _currencyAmount,
        currencySymbol: currencySymbol ?? _currencySymbol,
      );
  num? get amount => _amount;
  String? get displayAmount => _displayAmount;
  String? get currencyAmount => _currencyAmount;
  String? get currencySymbol => _currencySymbol;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['displayAmount'] = _displayAmount;
    map['currencyAmount'] = _currencyAmount;
    map['currencySymbol'] = _currencySymbol;
    return map;
  }
}

/// present : true
/// data : {"cancelPolicy":"7days before  check in no cancellations will applicable.","refundPolicy":"If cancel 72Hrs before check in 20% booking refunded.","childPolicy":"Above than 5 years payment will applicable.","damagePolicy":"Property damages applicable.","propertyRestriction":"Pets are not allowed. Minimum check in year 18+.","petsAllowed":false,"coupleFriendly":true,"suitableForChildren":true,"bachularsAllowed":true,"freeWifi":true,"freeCancellation":true,"payAtHotel":false,"payNow":true,"lastUpdatedOn":"2023-06-05 16:03:33"}

class PropertyPoliciesAndAmmenities {
  PropertyPoliciesAndAmmenities({
    bool? present,
    Property? data,
  }) {
    _present = present;
    _data = data;
  }

  PropertyPoliciesAndAmmenities.fromJson(dynamic json) {
    _present = json['present'];
    //_data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _present;
  Property? _data;
  PropertyPoliciesAndAmmenities copyWith({
    bool? present,
    Property? data,
  }) =>
      PropertyPoliciesAndAmmenities(
        present: present ?? _present,
        data: data ?? _data,
      );
  bool? get present => _present;
  Property? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['present'] = _present;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
