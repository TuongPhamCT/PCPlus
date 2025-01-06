import 'package:flutter/cupertino.dart';
import 'package:pcplus/builders/widget_builders/widget_builder_interface.dart';
import 'package:pcplus/commands/shop_home_command.dart';

import '../../commands/command_interface.dart';
import '../../models/items/item_model.dart';
import '../../models/users/user_model.dart';
import '../../views/widgets/listItem/shop_item.dart';

class ShopItemBuilder implements WidgetBuilderInterface {
  ItemModel? _product;
  UserModel? _shop;
  CommandInterface? _deleteCommand;
  CommandInterface? _editCommand;
  CommandInterface? _pressedCommand;
  double? _rating = 4.5;

  void setProduct(ItemModel product) {
    _product = product;
  }

  void setDeleteCommand(CommandInterface command) {
    _deleteCommand = command;
  }

  void setEditCommand(CommandInterface command) {
    _editCommand = command;
  }

  void setPressedCommand(CommandInterface command) {
    _pressedCommand = command;
  }

  void setShop(UserModel shop) {
    _shop = shop;
  }

  void setRating(double rating) {
    _rating = rating;
  }

  @override
  Widget? createWidget() {
    if (_product == null || _shop == null) {
      return null;
    }
    return ShopItem(
        itemName: _product!.name!,
        imagePath: _product!.image!,
        location: _shop!.getLocation(),
        rating: _rating!,
        price: _product!.price!,
        sold: _product!.sold!,
        editCommand: _editCommand,
        deleteCommand: _deleteCommand,
        pressedCommand: _pressedCommand,
        description: _product!.description!,
        quantity: _product!.stock!,
    );
  }

  @override
  void reset() {
    _product = null;
    _shop = null;
    _rating = 4.5;
    _editCommand = null;
    _deleteCommand = null;
  }

}