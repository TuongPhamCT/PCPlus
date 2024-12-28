import 'package:pcplus/builders/widget_builders/new_item_builder.dart';
import 'package:pcplus/builders/widget_builders/suggest_item_builder.dart';
import 'package:pcplus/builders/widget_builders/widget_builder_interface.dart';
import 'package:pcplus/commands/command_interface.dart';
import 'package:pcplus/models/items/item_model.dart';

class WidgetBuilderDirector {
  Future<void> makeNewItem({
    required WidgetBuilderInterface builder, required ItemModel product, required CommandInterface command
  }) async {
    if (builder is NewItemBuilder) {
      NewItemBuilder itemBuilder = builder;
      itemBuilder.reset();
      itemBuilder.setProduct(product);
      itemBuilder.setCommand(command);
      await itemBuilder.loadShop();
      await itemBuilder.loadRating();
      await itemBuilder.loadSoldCount();
    }
  }

  Future<void> makeSuggestItem({
    required WidgetBuilderInterface builder, required ItemModel product, required CommandInterface command
  }) async {
    if (builder is SuggestItemBuilder) {
      SuggestItemBuilder itemBuilder = builder;
      itemBuilder.reset();
      itemBuilder.setProduct(product);
      itemBuilder.setCommand(command);
      await itemBuilder.loadShop();
      await itemBuilder.loadRating();
      await itemBuilder.loadSoldCount();
    }
  }
}