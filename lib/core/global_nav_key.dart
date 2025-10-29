import 'package:flutter/material.dart';

class GlobalNavKey {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
  static const GlobalObjectKey homePageKey = GlobalObjectKey("HomePageGlobalKey");
  static const GlobalObjectKey bookedTripPageKey = GlobalObjectKey("BookedTripPageGlobalKey");
  static const GlobalObjectKey bookedAnyTripPageKey = GlobalObjectKey("BookedAnyTripPageGlobalKey");
  static const GlobalObjectKey ordersPageKey = GlobalObjectKey("OrderPageGlobalKey");
}
