/*enum LocationSelection {
  isInitialSelection,
  isDropInitialSelection,
  isPickupUpdateFromDropSelectionScreen,
  isPickupUpdateFromBookingConfirmScreen,
  isDropAddNewStopSelection,
  isDropUpdateFromDropSelectionScreen,
}*/

enum PaymentMode { cash, payTm, credit, online, wallet }

enum TransactionType { addCredit, order }

enum PaymentStatus { failed, captured, cancelled, pending, impsNEFT }

enum WalletType { payTmWallet }

const String rupee = "\u{20B9}";

//flutter build commands
//-> dart run build_runner build --delete-conflicting-outputs
//->adb connect 192.168.1.36:5555
//->flutter build apk --release --target-platform=android-arm (small size apk)
//1.Delete the podfile.lock (located in app root > ios folder)
//2.Run in Terminal pod install --repo-update
//3.flutter run
//flutter build appbundle --release
/*Delete the podfile.lock (located in app root > ios folder)
Run in Terminal pod install --repo-update
flutter run

asdf list all flutter
asdf list flutter
asdf install flutter 3.24.5
asdf uninstall flutter 3.24.5
asdf global flutter 3.24.5
asdf local flutter 2.24.5

*/
