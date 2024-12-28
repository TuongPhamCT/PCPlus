import 'package:pcplus/contract/home_contract.dart';
import 'package:pcplus/controller/api_controller.dart';
import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/models/items/item_repo.dart';
import 'package:pcplus/services/authentication_service.dart';

class HomePresenter {
  final HomeContract _view;
  HomePresenter(this._view);

  final ItemRepository _itemRepo = ItemRepository();
  final ApiController  _apiController = ApiController();
  final AuthenticationService _auth = AuthenticationService();

  static const MAX_NEWEST_ITEMS = 10;
  static const MAX_RECOMMENDED_ITEMS = 10;

  List<ItemModel> newestItems = [];
  List<ItemModel> recommendedItems = [];

  Future<void> getData() async {
    newestItems = await _itemRepo.getTopItems(MAX_NEWEST_ITEMS);
    List<String> itemIds = await _apiController.callApiRecommend(_auth.userId!, MAX_RECOMMENDED_ITEMS);
    for (String itemId in itemIds) {
      recommendedItems.add(await _itemRepo.getItemById(itemId));
    }
    _view.onLoadDataSucceed();
  }

  void handleItemPressed(ItemModel item) {
    _view.onItemPressed();
  }
}