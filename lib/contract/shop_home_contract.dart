import '../objects/suggest_item_data.dart';

abstract class ShopHomeContract {
  void onLoadDataSucceeded();
  void onFetchDataSucceeded();
  void onWaitingProgressBar();
  void onPopContext();
  void onItemEdit();
  void onItemDelete();
}