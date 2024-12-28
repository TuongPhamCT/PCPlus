import 'package:flutter/src/widgets/framework.dart';
import 'package:image/image.dart';
import 'package:pcplus/builders/widget_builders/widget_builder_interface.dart';
import 'package:pcplus/commands/command_interface.dart';
import 'package:pcplus/models/interactions/interaction_repo.dart';
import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/models/users/user_repo.dart';
import 'package:pcplus/views/widgets/listItem/new_item.dart';

import '../../models/users/user_model.dart';

class NewItemBuilder implements WidgetBuilderInterface {
  ItemModel? _product;
  UserModel? _shop;
  CommandInterface? _command;
  int? _sold = 0;
  double? _rating = 4.5;

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
    return NewItem(
        itemName: _product!.name!,
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
    _command = null;
  }

}