import 'package:pcplus/models/notification/notification_repo.dart';
import 'package:pcplus/singleton/user_singleton.dart';

import '../models/notification/notification_model.dart';
import '../models/orders/order_model.dart';
import '../models/users/user_model.dart';

class NotificationService {
  final NotificationRepository _notificationRepo = NotificationRepository();
  final UserSingleton _userSingleton = UserSingleton.getInstance();

  UserModel? get user => _userSingleton.currentUser;
  // TODO: Thong bao duoc tao ra tu nguoi dung

  Future<void> createOrderingNotification(OrderModel order) async {
    String customerName = user!.name!;

    NotificationModel notification = NotificationModel(
      title: "Order từ ${customerName}",
      content: "",
      isRead: false,
      date: DateTime.now(),
      productImage: order.itemModel!.image,
    );
    _notificationRepo.addNotificationToFirestore(
        order.itemModel!.sellerID!,
        notification
    );
  }

  // TODO: Thong bao duoc tao ra tu shop
}