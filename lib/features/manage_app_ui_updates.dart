import '../core/global_nav_key.dart';

class ManageAppUiUpdates {
  void updateHomePageOnOrderUpdates() {
    if (GlobalNavKey.homePageKey.currentContext != null) {
      //GlobalNavKey.homePageKey.currentContext!.read<HomeBloc>().add(const FetchHomeDataEvent());
    }
  }

  void updatePageOnUpdates() {
    if (GlobalNavKey.ordersPageKey.currentContext != null) {}
  }

  void manageUpdate() {
    updateHomePageOnOrderUpdates();
    updatePageOnUpdates();
  }
}
