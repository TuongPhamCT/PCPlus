import 'package:cloud_firestore/cloud_firestore.dart';

class NotificaionModel {
  String? nguoiNhan;
  String? title;
  String? content;
  DateTime? ngayTao;
  bool? isRead;
  String? productImage;

  static String collectionName = 'Notifications';

  NotificaionModel(
      {required this.nguoiNhan,
      required this.title,
      required this.content,
      required this.ngayTao,
      required this.isRead,
      required this.productImage});

  Map<String, dynamic> toJson() => {
        'nguoiNhan': nguoiNhan,
        'title': title,
        'content': content,
        'ngayTao': ngayTao,
        'isRead': isRead,
        'productImage': productImage
      };

  static NotificaionModel fromJson(Map<String, dynamic> json) {
    return NotificaionModel(
        nguoiNhan: json['nguoiNhan'] as String,
        title: json['title'] as String,
        content: json['content'] as String,
        ngayTao: (json['ngayTao'] as Timestamp).toDate(),
        isRead: json['isRead'] as bool,
        productImage: json['productImage'] as String);
  }
}
