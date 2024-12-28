import 'package:flutter/src/widgets/framework.dart';
import 'package:pcplus/builders/widget_builders/widget_builder_interface.dart';
import 'package:pcplus/commands/command_interface.dart';
import 'package:pcplus/models/interactions/interaction_repo.dart';
import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/models/users/user_repo.dart';

import '../../models/users/user_model.dart';
import '../../views/widgets/listItem/suggest_item.dart';

class SuggestItemBuilder implements WidgetBuilderInterface {
  ItemModel? _product;
  UserModel? _shop;
  int? _sold = 0;
  double? _rating = 4.5;
  CommandInterface? _command;

  void setProduct(ItemModel product) {
    _product = product;
  }

  void setCommand(CommandInterface command) {
    _command = command;
  }

  Future<void> loadShop() async {
    if (_product == null) {
      return;
    }
    UserRepository repo = UserRepository();
    _shop = await repo.getUserById(_product!.sellerID!);
  }

  Future<void> loadSoldCount() async {
    if (_product == null) {
      return;
    }
    InteractionRepository repo = InteractionRepository();
    _sold = await repo.getSoldCountByItemID(_product!.itemID!);
  }

  Future<void> loadRating() async {
    if (_product == null) {
      return;
    }

    InteractionRepository repo = InteractionRepository();
    _rating = await repo.getRatingByItemID(_product!.itemID!);
  }

  @override
  Widget? createWidget() {
    if (_product == null || _shop == null) {
      return null;
    }
    return SuggestItem(
        itemName: _product!.name!,
        description: _product!.description!,
        imagePath: _product!.image!,
        command: _command,
        location: _shop!.getLocation(),
        rating: _rating!,
        price: _product!.price!,
        sold: _sold!
    );
  }

  @override
  void reset() {
    _product = null;
    _shop = null;
    _sold = 0;
    _rating = 4.5;
  }

}