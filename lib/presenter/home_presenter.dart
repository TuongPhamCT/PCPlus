import 'package:pcplus/builders/object_builders/list_item_data_builder.dart';
import 'package:pcplus/builders/object_builders/list_object_builder_director.dart';
import 'package:pcplus/builders/object_builders/object_builder_interface.dart';
import 'package:pcplus/builders/widget_builders/suggest_item_builder.dart';
import 'package:pcplus/contract/home_contract.dart';
import 'package:pcplus/controller/api_controller.dart';
import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/models/items/item_repo.dart';
import 'package:pcplus/models/users/user_model.dart';
import 'package:pcplus/objects/data_object_interface.dart';
import 'package:pcplus/objects/suggest_item_data.dart';
import 'package:pcplus/services/authentication_service.dart';

class HomePresenter {
  final HomeContract _view;
  HomePresenter(this._view);

  final ItemRepository _itemRepo = ItemRepository();
  final ApiController  _apiController = ApiController();
  final AuthenticationService _auth = AuthenticationService();

  static const MAX_NEWEST_ITEMS = 10;
  static const MAX_RECOMMENDED_ITEMS = 10;

  List<ItemData> newestItems = [];
  List<ItemData> recommendedItems = [];

  Map<String, UserModel> cacheShop = {};

  Future<void> getData() async {
    final ListItemDataBuilder builder = ListItemDataBuilder();
    final Map<String, UserModel> cacheShops = {};
    final ListObjectBuilderDirector director = ListObjectBuilderDirector();

    List<ItemModel> newestItemModels = await _itemRepo.getTopItems(MAX_NEWEST_ITEMS);
    await director.makeListItemData(
        builder: builder,
        items: newestItemModels,
        shops: cacheShops
    );
    newestItems = builder.createList().cast<ItemData>();

    List<String> itemIds = await _apiController.callApiRecommend("5235448", MAX_RECOMMENDED_ITEMS);

    print(itemIds);
    // for (String itemId in itemIds) {
    //   recommendedItems.add(await _itemRepo.getItemById(itemId));
    // }

    _view.onLoadDataSucceed();
  }

  void handleItemPressed(ItemModel item) {
    _view.onItemPressed();
  }
}