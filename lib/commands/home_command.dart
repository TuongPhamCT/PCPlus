import 'package:pcplus/commands/command_interface.dart';
import 'package:pcplus/models/items/item_model.dart';
import 'package:pcplus/presenter/home_presenter.dart';

class HomeItemPressedCommand implements CommandInterface {
  final HomePresenter presenter;
  final ItemModel itemModel;

  HomeItemPressedCommand({
    required this.presenter,
    required this.itemModel
  });

  @override
  void execute() {
    presenter.handleItemPressed(itemModel);
  }

}