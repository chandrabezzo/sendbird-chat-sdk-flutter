import '../core/models/user.dart';

import 'event_manager.dart';

/// Represents a class to notify user event.
///
/// This is base class that you can mixin, so that you can register on
/// [SendbirdSdk.addUserEventHandler]. Typically you want to use this class as
/// following:
///
/// ```
/// class MyHandler with UserEventHandler {
///   @override
///   void onUpdateTotalUnreadMessageCount(int totalCount, Map<String, num> customTypesCount) {
///      // user logic when total unread message count is updated
///   }
/// }
/// ```
class UserEventHandler implements EventHandler {
  void onDiscoverFriends(List<User> friends) {}

  void onUpdateTotalUnreadMessageCount(
    int totalCount,
    Map<String, num> customTypesCount,
  ) {}
}